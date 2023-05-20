using CarInsurance.DataBase;
using CarInsurance.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace CarInsurance.Pages.Client
{
    /// <summary>
    /// Interaction logic for ClientProfilePage.xaml
    /// </summary>
    public partial class ClientProfilePage : Page
    {
        public DbPropertyValues OldValues;
        public User MainUser;
        public bool IsSave;
        public bool IsAdd;
        public ClientProfilePage(DataBase.User mainUser)
        {
            InitializeComponent();
            var driver = new Driver();
            IsSave = false;
            MainUser = mainUser;
            var dateNow = DateTime.Now.Date;
            DatePickerStartExperience.DisplayDateEnd = dateNow;
            DatePickerBirth.DisplayDateEnd = dateNow.AddYears(-18);
            if (mainUser.Driver.Count != 0)
            {
                driver = mainUser.Driver.First() as Driver;
                OldValues = GlobalSettings.DB.Entry(driver).CurrentValues.Clone();
                IsAdd = false;
            }
            else
            {
                DatePickerStartExperience.IsEnabled = false;
                driver.Experience = dateNow;
                driver.DateOfBirth = dateNow.AddYears(-18);
                IsAdd = true;
            }
            DataContext = driver;

        }

        public void Refresh()
        {
            var selectedDateBirth = DatePickerBirth.SelectedDate;
            if (selectedDateBirth != null)
            {
                DatePickerStartExperience.DisplayDateStart = selectedDateBirth.Value.AddYears(18);
                DatePickerStartExperience.IsEnabled = true;
                DatePickerStartExperience.SelectedDate = selectedDateBirth.Value.AddYears(18);
            }
        }

        private void ButtonSave_Click(object sender, RoutedEventArgs e)
        {
            var driver = DataContext as Driver;
            driver.UserId = MainUser.Id;
            var errorMessage = "";
            if (driver.Experience == null)
                errorMessage += "Выберите дату получения водительского удостоверения \n";
            if (driver.DateOfBirth == null)
                errorMessage += "Выберите дату рождения \n";
            if (driver.DriverLicense == null)
                errorMessage += "Введите водительское удостоверение\n";
            if (driver.Surname == null)
                errorMessage += "Введите фамилию\n";
            if (driver.Name == null)
                errorMessage += "Введите имя\n";
            if (driver.Patronic == null)
                errorMessage += "Введите отчество\n";
            if (driver.PassportData == null)
                errorMessage += "Введите Паспортные данные\n";
            if (driver.Email == null)
                errorMessage += "Введите Email\n";
            if (driver.Phone == null)
                errorMessage += "Введите номер телефона \n";
            string patternForPhone = @"^[0-9]{10}$";
            if (driver.Phone != null)
            {
                if (!Regex.IsMatch(driver.Phone, patternForPhone))
                    errorMessage += "Введите корректный номер телефона \n";
            }
            string patternForPassportData = @"^[0-9]{10}$";
            if (driver.PassportData != null)
            {
                if (!Regex.IsMatch(driver.PassportData, patternForPassportData))
                    errorMessage += "Введите корректные данные паспорта \n";
            }
            var patternForEmail = @"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
            if (driver.Email != null)
            {
                if (!Regex.IsMatch(driver.Email, patternForEmail))
                    errorMessage += "Введите корректный Email \n";
            }
            if (driver.DriverLicense != null)
            {
                string patternForLicense = @"[0-9]{10}$";
                if (!Regex.IsMatch(driver.DriverLicense, patternForLicense))
                    errorMessage += "Введите корректное водительское удостоверение \n";
            }
            if (!string.IsNullOrWhiteSpace(errorMessage))
            {
                MessageBox.Show(errorMessage);
                return;
            }
            if (IsAdd)
            {
                driver.BlackList = false;
                var messageAboutError = "";
                var driverLicense = GlobalSettings.DB.Driver.FirstOrDefault(u => u.DriverLicense == driver.DriverLicense);
                if (driverLicense != null)
                    messageAboutError += "Это водительское удостоверение уже было занято \n";
                var passport = GlobalSettings.DB.Driver.FirstOrDefault(u => u.PassportData == driver.PassportData);
                if (passport != null)
                    messageAboutError += "Эти паспортные данные уже были заняты \n";
                if (!string.IsNullOrWhiteSpace(messageAboutError))
                {
                    MessageBox.Show(messageAboutError);
                    return;
                }
                GlobalSettings.DB.Driver.Add(driver);
            }
            GlobalSettings.DB.SaveChanges();
            IsSave = true;
            MessageBox.Show("Все успешно сохранено");
        }

        private void Page_Unloaded(object sender, RoutedEventArgs e)
        {
            if (!IsSave)
            {

                var driver = DataContext as Driver;
                if (OldValues != null)
                {
                    GlobalSettings.DB.Entry(driver).CurrentValues.SetValues(OldValues);

                }
            }
        }

        private void DatePickerBirth_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            Refresh();
        }

        private void DatePickerStartExperience_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            Refresh();
        }
    }
}

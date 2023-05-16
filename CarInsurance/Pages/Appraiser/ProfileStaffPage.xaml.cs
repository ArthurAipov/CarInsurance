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

namespace CarInsurance.Pages.Appraiser
{
    /// <summary>
    /// Interaction logic for ProfileStaffPage.xaml
    /// </summary>
    public partial class ProfileStaffPage : Page
    {
        public DbPropertyValues OldValues;
        public User MainUser;
        public bool IsSave;
        public bool IsAdd = true;
        public ProfileStaffPage(DataBase.User mainUser)
        {
            MainUser = mainUser;
            IsSave = false;
            var staff = new Staff();
            if (mainUser.Staff.Count != 0)
            {
                staff = mainUser.Staff.First() as Staff;
                OldValues = GlobalSettings.DB.Entry(staff).CurrentValues.Clone();
                IsAdd = false;
            }
            else
            {
                IsAdd = true;
            }
            DataContext = staff;
        }

        private void ButtonSave_Click(object sender, RoutedEventArgs e)
        {
            var staff = DataContext as Staff;
            staff.UserId = MainUser.Id;
            var errorMessage = "";
            if (staff.Email == null)
                errorMessage += "Введите Email\n";
            if (staff.Phone == null)
                errorMessage += "Введите номер телефона \n";
            string patternForPhone = @"^[0-9]{10}$";
            if (!Regex.IsMatch(staff.Phone, patternForPhone))
                errorMessage += "Введите корректный номер телефона \n";
            var patternForEmail = @"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
            if (!Regex.IsMatch(staff.Email, patternForEmail))
                errorMessage += "Введите корректный Email \n";
            if (!string.IsNullOrWhiteSpace(errorMessage))
            {
                MessageBox.Show(errorMessage);
                return;
            }
            if (IsAdd)
            {
                var messageAboutError = "";
                var emailStaff = GlobalSettings.DB.Staff.FirstOrDefault(u => u.Email == staff.Email);
                if (emailStaff != null)
                    messageAboutError += "Этот Email уже занят\n";
                if (!string.IsNullOrWhiteSpace(messageAboutError))
                {
                    MessageBox.Show(messageAboutError);
                    return;
                }
                GlobalSettings.DB.Staff.Add(staff);
            }
            GlobalSettings.DB.SaveChanges();
            IsSave = true;
            MessageBox.Show("Все успешно сохранено");
        }

        private void Page_Unloaded(object sender, RoutedEventArgs e)
        {
            if (!IsSave)
            {
                var staff = DataContext as Staff;
                GlobalSettings.DB.Entry(staff).CurrentValues.SetValues(OldValues);
            }
        }
    }
}
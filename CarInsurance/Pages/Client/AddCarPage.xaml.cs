using CarInsurance.DataBase;
using CarInsurance.Models;
using System;
using System.Collections.Generic;
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
    /// Interaction logic for AddCarPage.xaml
    /// </summary>
    public partial class AddCarPage : Page
    {
        public User MainUser;
        public AddCarPage(User user)
        {
            InitializeComponent();
            DatePickerDateOfPurchase.SelectedDate = DateTime.Now.Date;
            DatePickerDateOfPurchase.DisplayDateEnd = DateTime.Now.Date;
            DataContext = new Car();
            MainUser = user;

        }
        public void Refresh()
        {
            ComboBoxBrand.ItemsSource = GlobalSettings.DB.Brand.ToList();
            if (ComboBoxBrand.SelectedItem != null)
            {
                var selectedBrand = ComboBoxBrand.SelectedItem as Brand;
                var models = GlobalSettings.DB.Model.Where(u => u.Make == selectedBrand.Name).ToList();
                ComboBoxModel.ItemsSource = models;
            }
        }

        private void ButtonSave_Click(object sender, RoutedEventArgs e)
        {
            var car = DataContext as Car;
            var date = DatePickerDateOfPurchase.SelectedDate;
            car.DateOfPurchase = date.Value;
            var model = ComboBoxModel.SelectedItem as Model;
            car.Driver = MainUser.Driver.First();
            car.Model = model;
            var errorMessage = "";
            if (car.VIN == null)
                errorMessage += "Введите вин номер \n";
            if (car.Number == null)
                errorMessage += "Введите номер \n";
            if (car.Horsepower.ToString() == null)
                errorMessage += "Введите мощность \n";
            if (car.Passport == null)
                errorMessage += "Введите пасторт тс \n";
            if (car.DateOfPurchase == null)
                errorMessage += "Ввеите дату покупки \n";
            if (car.Model == null)
                errorMessage += "Выберите модель машины \n";
            var checkNum = GlobalSettings.DB.Car.FirstOrDefault(u => u.Number == car.Number);
            if (checkNum != null)
                errorMessage += "Данный номер уже был зарегистрирован \n";
            string patternForNumber = @"^[ABEKMHOPCTYX]\d{3}(?<!000)[ABEKMHOPCTYX]{2}\d{2,3}$";
            if (!Regex.IsMatch(car.Number, patternForNumber) && car.Number != null)
                errorMessage += "Введите корректный номер машины \n";
            string patternForPassport = @"^[0-9]{2}[ABEKMHOPCTYX]{2}[0-9]{6}$";
            if (!Regex.IsMatch(car.Passport, patternForPassport) && car.Passport != null)
                errorMessage += "Введите корректный паспорт тс \n";
            if (car.Horsepower <= 0)
                errorMessage += "Введите мощность \n";
            string patternForVINNumber = @"^[ABEKMHOPCTYX0-9]$";
            if (!Regex.IsMatch(car.VIN, patternForVINNumber) && car.VIN.Length != 17)
                errorMessage += "Введите корректный VIN номер \n";
            if (!string.IsNullOrWhiteSpace(errorMessage))
            {
                MessageBox.Show(errorMessage);
                return;
            }
            GlobalSettings.DB.Car.Add(car);
            GlobalSettings.DB.SaveChanges();
            NavigationService.GoBack();
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Refresh();
        }

        private void ComboBoxBrand_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Refresh();

        }
    }
}

using CarInsurance.DataBase;
using CarInsurance.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
    /// Interaction logic for ClientOsagoPage.xaml
    /// </summary>
    public partial class ClientOsagoPage : Page
    {
        public User MainUser;
        public Driver MainDriver;
        public double TotalPrice;
        public List<CountOfUser> countList = new List<CountOfUser>();
        public ClientOsagoPage(DataBase.User mainUser)
        {
            InitializeComponent();
            MainUser = mainUser;
            var oneUser = new CountOfUser { Id = 1, Name = "Один" };
            var twoUser = new CountOfUser { Id = 2, Name = "Два" };
            var Unlimited = new CountOfUser { Id = 3, Name = "Безгранично" };
            countList.Add(oneUser);
            countList.Add(twoUser);
            countList.Add(Unlimited);
            ComboBoxCountUsers.ItemsSource = countList.ToList();
            var driver = GlobalSettings.DB.Driver.FirstOrDefault(u => u.UserId == mainUser.Id);
            MainDriver = driver;
            var cars = GlobalSettings.DB.Car.Where(u => u.DriverId == driver.Id).ToList();
            DatePickerDateStart.SelectedDate = DateTime.Now;
            DatePickerDateEnd.SelectedDate = DateTime.Now.AddYears(1);
            DatePickerDateEnd.IsEnabled = false;
            DatePickerDateStart.IsEnabled = false;
            var regions = GlobalSettings.DB.Region.ToList();
            ComboBoxCar.ItemsSource = cars;
            ComboBoxRegion.ItemsSource = regions;
            DataContext = new Osago();

        }

        public void Refresh()
        {
            double fullPrice = 5000;
            var selectedCar = ComboBoxCar.SelectedItem as Car;
            var selectsdRegion = ComboBoxRegion.SelectedItem as Region;
            if (selectsdRegion != null)
            {
                var coefficient = selectsdRegion.CoefficientForOsago;
                fullPrice = fullPrice * coefficient;
            }
            var experience = DateTime.Now.Year - MainDriver.Experience.Year;
            var birth = DateTime.Now.Year - MainDriver.DateOfBirth.Year;
            var selectedCount = ComboBoxCountUsers.SelectedItem as CountOfUser;
            if (selectedCount != null)
            {
                if (selectedCount.Id == 2)
                    fullPrice = fullPrice * 1.3;
                if (selectedCount.Id == 3)
                    fullPrice = fullPrice * 2.6;
            }
            if (experience == 0)
            {
                if (birth >= 16 && birth <= 21)
                    fullPrice = fullPrice * 2.27;
                if (birth >= 22 && birth <= 24)
                    fullPrice = fullPrice * 1.88;
                if (birth >= 25 && birth <= 29)
                    fullPrice = fullPrice * 1.72;
                if (birth >= 30 && birth <= 34)
                    fullPrice = fullPrice * 1.56;
                if (birth >= 35 && birth <= 39)
                    fullPrice = fullPrice * 1.54;
                if (birth >= 40 && birth <= 49)
                    fullPrice = fullPrice * 1.50;
                if (birth >= 50 && birth <= 59)
                    fullPrice = fullPrice * 1.46;
                if (birth > 59)
                    fullPrice = fullPrice * 1.43;
            }
            if (experience == 1)
            {
                if (birth >= 16 && birth <= 21)
                    fullPrice = fullPrice * 1.92;
                if (birth >= 22 && birth <= 24)
                    fullPrice = fullPrice * 1.72;
                if (birth >= 25 && birth <= 29)
                    fullPrice = fullPrice * 1.60;
                if (birth >= 30 && birth <= 34)
                    fullPrice = fullPrice * 1.50;
                if (birth >= 35 && birth <= 39)
                    fullPrice = fullPrice * 1.47;
                if (birth >= 40 && birth <= 49)
                    fullPrice = fullPrice * 1.44;
                if (birth >= 50 && birth <= 59)
                    fullPrice = fullPrice * 1.40;
                if (birth > 59)
                    fullPrice = fullPrice * 1.36;

            }
            if (experience == 2)
            {
                if (birth >= 16 && birth <= 21)
                    fullPrice = fullPrice * 1.84;
                if (birth >= 22 && birth <= 24)
                    fullPrice = fullPrice * 1.71;
                if (birth >= 25 && birth <= 29)
                    fullPrice = fullPrice * 1.54;
                if (birth >= 30 && birth <= 34)
                    fullPrice = fullPrice * 1.48;
                if (birth >= 35 && birth <= 39)
                    fullPrice = fullPrice * 1.46;
                if (birth >= 40 && birth <= 49)
                    fullPrice = fullPrice * 1.43;
                if (birth >= 50 && birth <= 59)
                    fullPrice = fullPrice * 1.39;
                if (birth > 59)
                    fullPrice = fullPrice * 1.35;

            }
            if (experience == 3 || experience == 4)
            {
                if (birth >= 16 && birth <= 21)
                    fullPrice = fullPrice * 1.65;
                if (birth >= 22 && birth <= 24)
                    fullPrice = fullPrice * 1.13;
                if (birth >= 25 && birth <= 29)
                    fullPrice = fullPrice * 1.09;
                if (birth >= 30 && birth <= 34)
                    fullPrice = fullPrice * 1.05;
                if (birth >= 35 && birth <= 39)
                    fullPrice = fullPrice * 1.00;
                if (birth >= 40 && birth <= 49)
                    fullPrice = fullPrice * 0.96;
                if (birth >= 50 && birth <= 59)
                    fullPrice = fullPrice * 0.93;
                if (birth > 59)
                    fullPrice = fullPrice * 0.91;

            }
            if (experience == 5 || experience == 6)
            {
                if (birth >= 16 && birth <= 21)
                    fullPrice = fullPrice * 1.62;
                if (birth >= 22 && birth <= 24)
                    fullPrice = fullPrice * 1.10;
                if (birth >= 25 && birth <= 29)
                    fullPrice = fullPrice * 1.08;
                if (birth >= 30 && birth <= 34)
                    fullPrice = fullPrice * 1.04;
                if (birth >= 35 && birth <= 39)
                    fullPrice = fullPrice * 0.97;
                if (birth >= 40 && birth <= 49)
                    fullPrice = fullPrice * 0.95;
                if (birth >= 50 && birth <= 59)
                    fullPrice = fullPrice * 0.92;
                if (birth > 59)
                    fullPrice = fullPrice * 0.90;

            }
            if (experience >= 7 && experience <= 9)
            {
                if (birth >= 22 && birth <= 24)
                    fullPrice = fullPrice * 1.09;
                if (birth >= 25 && birth <= 29)
                    fullPrice = fullPrice * 1.07;
                if (birth >= 30 && birth <= 34)
                    fullPrice = fullPrice * 1.01;
                if (birth >= 35 && birth <= 39)
                    fullPrice = fullPrice * 0.95;
                if (birth >= 40 && birth <= 49)
                    fullPrice = fullPrice * 0.94;
                if (birth >= 50 && birth <= 59)
                    fullPrice = fullPrice * 0.91;
                if (birth > 59)
                    fullPrice = fullPrice * 0.89;
            }
            if (experience >= 10 && experience <= 14)
            {
                if (birth >= 25 && birth <= 29)
                    fullPrice = fullPrice * 1.02;
                if (birth >= 30 && birth <= 34)
                    fullPrice = fullPrice * 0.97;
                if (birth >= 35 && birth <= 39)
                    fullPrice = fullPrice * 0.94;
                if (birth >= 40 && birth <= 49)
                    fullPrice = fullPrice * 0.93;
                if (birth >= 50 && birth <= 59)
                    fullPrice = fullPrice * 0.90;
                if (birth > 59)
                    fullPrice = fullPrice * 0.88;
            }
            if (experience > 14)
            {
                if (birth >= 30 && birth <= 34)
                    fullPrice = fullPrice * 0.95;
                if (birth >= 35 && birth <= 39)
                    fullPrice = fullPrice * 0.93;
                if (birth >= 40 && birth <= 49)
                    fullPrice = fullPrice * 0.91;
                if (birth >= 50 && birth <= 59)
                    fullPrice = fullPrice * 0.86;
                if (birth > 59)
                    fullPrice = fullPrice * 0.83;
            }
            TextBoxPrice.Text = "Полная цена:" + fullPrice.ToString();
            TotalPrice = fullPrice;
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void ButtonIssue_Click(object sender, RoutedEventArgs e)
        {
            var osago = DataContext as Osago;
            osago.DriverId = MainDriver.Id;
            osago.DateStart = DatePickerDateStart.SelectedDate.Value;
            osago.DateEnd = DatePickerDateEnd.SelectedDate.Value;
            var erroMessage = "";
            var selectedCar = ComboBoxCar.SelectedItem as Car;
            var selectsdRegion = ComboBoxRegion.SelectedItem as Region;
            var selectedCount = ComboBoxCountUsers.SelectedItem as CountOfUser;
            if (selectedCar == null)
                erroMessage += "Выберите машину \n";
            if (selectsdRegion == null)
                erroMessage += "Выберите регион \n";
            if (selectedCount == null)
                erroMessage += "выберите количество возможных водителей \n";
            if (!string.IsNullOrWhiteSpace(erroMessage))
            {
                MessageBox.Show(erroMessage);
                return;
            }
            osago.RegionId = selectsdRegion.Id;
            osago.Price = TotalPrice;
            osago.CarId = selectedCar.Id;
            GlobalSettings.DB.Osago.Add(osago);
            GlobalSettings.DB.SaveChanges();
            NavigationService.GoBack();
            

        }

        private void ComboBoxCar_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Refresh();
        }

        private void ComboBoxRegion_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Refresh();
        }

        private void ComboBoxCountUsers_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Refresh();
        }
    }
}

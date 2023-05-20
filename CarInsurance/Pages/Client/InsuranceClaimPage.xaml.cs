using CarInsurance.DataBase;
using CarInsurance.Models;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
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
    /// Interaction logic for InsuranceClaimPage.xaml
    /// </summary>
    public partial class InsuranceClaimPage : Page
    {
        public List<byte[]> PhotosForApplication = new List<byte[]>();
        public Driver MainDriver;
        public Osago MainOsago;
        public InsuranceClaimPage(DataBase.Osago selectedOsago)
        {
            var emergency = new EmergencyApplication();
            var driver = selectedOsago.Driver;
            var dateNow = DateTime.Now.Date;
            MainDriver = driver;
            MainOsago = selectedOsago;
           // DatePickerDate.SelectedDate = dateNow;
            var cars = GlobalSettings.DB.Car.Where(u => u.DriverId == MainOsago.DriverId).ToList();
            ComboBoxCar.ItemsSource = cars.ToList();
            //DatePickerDate.DisplayDateEnd = dateNow.AddDays(1);
            //DatePickerDate.DisplayDateStart = dateNow.AddDays(-7);
            //DataContext = emergency;
            InitializeComponent();
        }

        public void Refresh()
        {
           
        }

        private void ButtonAddPhoto_Click(object sender, RoutedEventArgs e)
        {
            var openFileDialog = new OpenFileDialog() { Filter = ".png, .jpg, .jpeg| *.png; *.jpg; *.jpeg" };
            if (openFileDialog.ShowDialog() == true)
            {
                var file = openFileDialog.FileName;
                var photo = File.ReadAllBytes(file);
                PhotosForApplication.Add(photo);
            }
        }

        private void ButtonAddEmergencyApplication_Click(object sender, RoutedEventArgs e)
        {
            var application = new EmergencyApplication();
            application.StatusId = 3;
            application.DriverId = MainDriver.Id;
            var errorMessage = "";
            var selectedCar = ComboBoxCar.SelectedItem as Car;
            if (selectedCar == null)
            {
                errorMessage += "Выберите машину\n";
            }
            if (DatePickerDate.SelectedDate == null)
            {
                errorMessage += "Выберите дату дтп\n";
            }
            if (string.IsNullOrWhiteSpace(errorMessage))
            {
                MessageBox.Show(errorMessage);
                return;
            }
            application.DateEmergency = DatePickerDate.SelectedDate.Value;
            application.CarId = selectedCar.Id;
            application.Price = 0.00;
            application.ApplicationType = 1;
            GlobalSettings.DB.EmergencyApplication.Add(application);
            GlobalSettings.DB.SaveChanges();
            var applicationId = GlobalSettings.DB.EmergencyApplication.Where(u => u.DriverId == MainDriver.Id).Last().Id;
            foreach (var photo in PhotosForApplication)
            {
                var emergencyPhoto = new PhotoEmergency { EmergencyApplicationId = applicationId, Photo = photo };
                GlobalSettings.DB.PhotoEmergency.Add(emergencyPhoto);
                GlobalSettings.DB.SaveChanges();
            }

        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}

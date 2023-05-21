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
using System.Windows.Shapes;

namespace CarInsurance.Windows
{
    /// <summary>
    /// Interaction logic for InsuraceClaimCascoWindow.xaml
    /// </summary>
    public partial class InsuraceClaimCascoWindow : Window
    {
        public List<byte[]> PhotosForApplication = new List<byte[]>();
        public Driver MainDriver;
        public Casco MainCasco;
        public InsuraceClaimCascoWindow(Casco selectedCasco)
        {
            var emergency = new EmergencyApplication();
            var driver = selectedCasco.Driver;
            var dateNow = DateTime.Now.Date;
            emergency.DateEmergency = dateNow;
            MainDriver = driver;
            MainCasco = selectedCasco;
            DataContext = emergency;
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
            var application = DataContext as EmergencyApplication;
            application.StatusId = 3;
            application.DriverId = MainDriver.Id;
            var errorMessage = "";
            if (DatePickerDate.SelectedDate == null)
            {
                errorMessage += "Выберите дату дтп\n";
            }
            if (PhotosForApplication.Count == 0)
            {
                errorMessage += "Добавьте фото\n";
            }
            if (!string.IsNullOrWhiteSpace(errorMessage))
            {
                MessageBox.Show(errorMessage);
                return;
            }
            application.DateEmergency = DatePickerDate.SelectedDate.Value;
            application.CarId = MainCasco.CarId;
            application.Price = 0.00;
            application.ApplicationType = 1;
            GlobalSettings.DB.EmergencyApplication.Add(application);
            GlobalSettings.DB.SaveChanges();
            var applicationId = GlobalSettings.DB.EmergencyApplication.Where(u => u.DriverId == MainDriver.Id).ToList();
            foreach (var photo in PhotosForApplication)
            {
                var applicationIdForPhoto = applicationId.Last().Id;
                var emergencyPhoto = new PhotoEmergency { EmergencyApplicationId = applicationIdForPhoto, Photo = photo };
                GlobalSettings.DB.PhotoEmergency.Add(emergencyPhoto);
                GlobalSettings.DB.SaveChanges();
            }
            this.DialogResult = true;

        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = false;
        }
    }
} 
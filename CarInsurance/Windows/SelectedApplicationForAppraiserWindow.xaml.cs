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
    /// Interaction logic for SelectedApplicationForAppraiserWindow.xaml
    /// </summary>
    public partial class SelectedApplicationForAppraiserWindow : Window
    {
        public EmergencyApplication MainApplication;
        public int ClickCount;
        public List<byte[]> PhotosForApplication = new List<byte[]>();
        public SelectedApplicationForAppraiserWindow(DataBase.EmergencyApplication selectedApplication)
        {
            InitializeComponent();
            DataContext = selectedApplication;
        }

        private void ButtonSave_Click(object sender, RoutedEventArgs e)
        {
            var application = DataContext as EmergencyApplication;
            if (application.Price <= 0)
            {
                MessageBox.Show("Введите корректную ценну");
                return;
            }
            if (PhotosForApplication.Count == 0)
            {
                MessageBox.Show("Добавьте фото\n");
            }
            application.StatusId = 4;
            GlobalSettings.DB.SaveChanges();
            var applicationId = GlobalSettings.DB.EmergencyApplication.Where(u => u.DriverId == application.Driver.Id).ToList();
            foreach (var photo in PhotosForApplication)
            {
                var applicationIdForPhoto = applicationId.Last().Id;
                var emergencyPhoto = new PhotoEmergency { EmergencyApplicationId = applicationIdForPhoto, Photo = photo };
                GlobalSettings.DB.PhotoEmergency.Add(emergencyPhoto);
            }
            GlobalSettings.DB.SaveChanges();
            this.DialogResult = true;
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

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = false;
        }
    }
}

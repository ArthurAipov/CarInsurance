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
    /// Interaction logic for IncuranceClaimOsagoPage.xaml
    /// </summary>
    public partial class IncuranceClaimOsagoPage : Window
    {
        public List<byte[]> PhotosForApplication = new List<byte[]>();
        public Driver MainDriver;
        public Osago MainOsago;
        public IncuranceClaimOsagoPage(Osago selectedOsago)
        {
            var emergency = new EmergencyApplication();
            var driver = selectedOsago.Driver;
            var dateNow = DateTime.Now.Date;
            emergency.DateEmergency = dateNow;
            MainDriver = driver;
            MainOsago = selectedOsago;
            DataContext = emergency;
            InitializeComponent();
        }

        public void Refresh()
        {

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
            if (!string.IsNullOrWhiteSpace(errorMessage))
            {
                MessageBox.Show(errorMessage);
                return;
            }
            application.DateEmergency = DatePickerDate.SelectedDate.Value;
            application.CarId = MainOsago.CarId;
            application.Price = 0.00;
            application.ApplicationType = 1;
            GlobalSettings.DB.EmergencyApplication.Add(application);
            GlobalSettings.DB.SaveChanges();
            this.DialogResult = true;

        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = false;
        }
    }
}
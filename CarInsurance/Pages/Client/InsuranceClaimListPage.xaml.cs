﻿using CarInsurance.Models;
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
    /// Interaction logic for InsuranceClaimListPage.xaml
    /// </summary>
    public partial class InsuranceClaimListPage : Page
    {
        public InsuranceClaimListPage(DataBase.User mainUser)
        {
            InitializeComponent();
            var driverId = mainUser.Driver.First().Id;
            var applicationList = GlobalSettings.DB.EmergencyApplication.Where(u => u.DriverId == driverId).ToList();
            DataGridEmergency.ItemsSource = applicationList.ToList();
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}

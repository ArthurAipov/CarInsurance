﻿using CarInsurance.DataBase;
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

namespace CarInsurance.Pages.Accountant
{
    /// <summary>
    /// Interaction logic for MainPageAccountant.xaml
    /// </summary>
    public partial class MainPageAccountant : Page
    {
        public User MainUser;
        public MainPageAccountant(DataBase.User user)
        {
            InitializeComponent();
            MainUser = user;
        }

        private void ButtondsProfile_Click(object sender, RoutedEventArgs e)
        {
            AdminFrame.NavigationService.Navigate(new AccountProfilePage(MainUser));
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AutorizationPage());
        }

        private void ButtonDataAboutInsurance_Click(object sender, RoutedEventArgs e)
        {
            AdminFrame.NavigationService.Navigate(new InsuranceDataPage());
        }

        private void ButtonDrivers_Click(object sender, RoutedEventArgs e)
        {
            AdminFrame.NavigationService.Navigate(new DriversBlackListPage());
        }

        private void ButtonApplicationList_Click(object sender, RoutedEventArgs e)
        {
            AdminFrame.NavigationService.Navigate(new ApplicationsForAccountantPage());
        }
    }
}

using CarInsurance.DataBase;
using CarInsurance.Models;
using CarInsurance.Windows;
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
    /// Interaction logic for DriversBlackListPage.xaml
    /// </summary>
    public partial class DriversBlackListPage : Page
    {
        public DriversBlackListPage()
        {
            InitializeComponent();
            Refresh();

        }

        public void Refresh()
        {
            var searchPassport = TextBoxPassportData.Text;
            var filter = GlobalSettings.DB.Driver.ToList();
            if (!string.IsNullOrWhiteSpace(searchPassport))
            {
                filter = filter.Where(u => u.PassportData.Contains(searchPassport)).ToList();
            }
            var checkBlackList = CheckBoxBlackList.IsChecked;
            if(checkBlackList != null)
            {
                filter = filter.Where(u => u.BlackList == checkBlackList).ToList();
            }
            DataGridDrivers.ItemsSource = filter;
        }

        private void TextBoxPassportData_TextChanged(object sender, TextChangedEventArgs e)
        {
            Refresh();
        }

        private void CheckBoxBlackList_Checked(object sender, RoutedEventArgs e)
        {
            Refresh();
        }

        private void CheckBoxBlackList_Unchecked(object sender, RoutedEventArgs e)
        {
            Refresh();
        }

        private void DataGridDrivers_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var selectedUser = DataGridDrivers.SelectedItem as Driver;
            new ProfileDialogWindow(selectedUser).ShowDialog();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Refresh();
        }
    }
}

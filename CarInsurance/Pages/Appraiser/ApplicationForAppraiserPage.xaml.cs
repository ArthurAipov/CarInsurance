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

namespace CarInsurance.Pages.Appraiser
{
    /// <summary>
    /// Interaction logic for ApplicationForAppraiserPage.xaml
    /// </summary>
    public partial class ApplicationForAppraiserPage : Page
    {
        public ApplicationForAppraiserPage()
        {
            InitializeComponent();
            Refresh();
        }

        public void Refresh()
        {
            DataGridEmergency.ItemsSource = GlobalSettings.DB.EmergencyApplication.Where(u => u.StatusId == 3).ToList();
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void DataGridEmergency_MouseRightButtonDown(object sender, MouseButtonEventArgs e)
        {
            var selectedApplication = DataGridEmergency.SelectedItem as EmergencyApplication;
            if (selectedApplication == null)
            {
                MessageBox.Show("Выберите заявку");
                return;
            }
            new SelectedApplicationForAppraiserWindow(selectedApplication).ShowDialog();
            Refresh();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Refresh();
        }

        private void DataGridEmergency_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var selectedEmergency = DataGridEmergency.SelectedItem as EmergencyApplication;
            var selectedDriver = selectedEmergency.Driver;
            new ProfileDialogWindow(selectedDriver).ShowDialog();
        }
    }
}
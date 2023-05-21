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
using System.Windows.Shapes;

namespace CarInsurance.Windows
{
    /// <summary>
    /// Interaction logic for AcsessWindow.xaml
    /// </summary>
    public partial class AcsessWindow : Window
    {
        public EmergencyApplication MainApplication;
        public AcsessWindow(DataBase.EmergencyApplication selectedApplication)
        {
            InitializeComponent();
            MainApplication = selectedApplication;
        }

        private void ButtonAcsess_Click(object sender, RoutedEventArgs e)
        {
            MainApplication.StatusId = 1;
            GlobalSettings.DB.SaveChanges();
            this.DialogResult = true;
        }

        private void ButtonDenide_Click(object sender, RoutedEventArgs e)
        {
            MainApplication.StatusId = 2;
            GlobalSettings.DB.SaveChanges();
            this.DialogResult = false;
        }
    }
}

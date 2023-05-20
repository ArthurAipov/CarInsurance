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
    /// Interaction logic for ProfileDialogWindow.xaml
    /// </summary>
    public partial class ProfileDialogWindow : Window
    {
        public ProfileDialogWindow(DataBase.Driver selectedUser)
        {
            InitializeComponent();
            DataContext = selectedUser;
            if (selectedUser.BlackList)
            {
                ButtonSave.Content = "Убрать из черного списка";
            }
            else
            {
                ButtonSave.Content = "Добавить в черный список";
            }
        }

        private void ButtonExite_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = false;
        }

        private void ButtonSave_Click(object sender, RoutedEventArgs e)
        {
            var driver = DataContext as Driver;
            if (ButtonSave.Content.ToString() == "Добавить в черный список")
            {
                driver.BlackList = true;
            }
            else
            {
                driver.BlackList = false;
            }
            GlobalSettings.DB.SaveChanges();
            this.DialogResult = true;
        }
    }
}

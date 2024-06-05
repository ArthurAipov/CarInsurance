using CarInsurance.DataBase;
using CarInsurance.Models;
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
    /// Interaction logic for AcsessWindow.xaml
    /// </summary>
    public partial class AcsessWindow : Window
    {
        private EmergencyApplication MainApplication;
        private int ClickCount;
        private List<ImageSource> PhotoForApplication = new List<ImageSource>();
        public AcsessWindow(DataBase.EmergencyApplication selectedApplication)
        {
            InitializeComponent();
            MainApplication = selectedApplication;
            MainApplication = selectedApplication;
            foreach (var image in GlobalSettings.DB.PhotoEmergency.Where(u => u.EmergencyApplicationId == selectedApplication.Id).ToList())
            {
                var photo = ByteToImage(image.Photo);
                PhotoForApplication.Add(photo);
            }
            PhotoApplication.Source = PhotoForApplication[0];
            DataContext = selectedApplication;
        }

        public static ImageSource ByteToImage(byte[] imageData)
        {
            BitmapImage biImg = new BitmapImage();
            MemoryStream ms = new MemoryStream(imageData);
            biImg.BeginInit();
            biImg.StreamSource = ms;
            biImg.EndInit();

            ImageSource imgSrc = biImg as ImageSource;

            return imgSrc;
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

        private void ButtonPrevious_Click(object sender, RoutedEventArgs e)
        {
            if (ClickCount <= PhotoForApplication.Count - 1 && ClickCount != 0)
            {
                ClickCount--;
                PhotoApplication.Source = PhotoForApplication[ClickCount];
            }
        }

        private void ButtonNext_Click(object sender, RoutedEventArgs e)
        {
            if (ClickCount < PhotoForApplication.Count - 1)
            {
                ClickCount++;
                PhotoApplication.Source = PhotoForApplication[ClickCount];
            }
        }
    }
}

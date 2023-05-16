using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarInsurance.Models
{
    public class OsagoCasco
    {
        public string CarNumber { get; set; }
        public DateTime DateStart { get; set; }
        public DateTime DateEnd { get; set; }
        public string ThisType { get; set; }
        public double Price { get; set; }   
    }
}

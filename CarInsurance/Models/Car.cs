using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarInsurance.DataBase
{
    public partial class Car
    {
        public string CarNumberMakeModel
        {
            get
            {
                var carNumMakeModel = Model.Make + " " + Model.ModelYear + " " + Number;
                return carNumMakeModel;
            }
        }
    }
}

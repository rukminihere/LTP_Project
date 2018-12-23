using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LTP_DAL
{
    public class DTOPerson
    {
        public int PersonID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int StateID { get; set; }
        public string StateCode { get; set; }
        public char Gender { get; set; }
        public DateTime DOB { get; set; }
    }
}

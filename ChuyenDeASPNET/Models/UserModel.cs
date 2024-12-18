using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ChuyenDeASPNET.Models
{
    public class UserModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone { get; set; }
        public int Password { get; set; }
    }
}
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity;
using Projekat.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Projekat.Logic
{
    public class RoleAction
    {
        internal void AddUserAndRole()
        {
            Models.ApplicationDbContext context = new ApplicationDbContext();
            IdentityResult IdRoleResult;
            IdentityResult IdUserResult;

            var roleStore = new RoleStore<IdentityRole>(context);

            var roleMgr = new RoleManager<IdentityRole>(roleStore);

            if (!roleMgr.RoleExists("canEdit"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "canEdit" });
            }

            var userMgr = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            var appUser = new ApplicationUser
            //dajemo username i email korisniku, ako nisu isti, mozda nece hteti da se uloguje
            {
                UserName = "relja@gmail.com ",
                Email = "relja@gmail.com"
            };

            IdUserResult = userMgr.Create(appUser, "Relj@2004");

            if (!userMgr.IsInRole(userMgr.FindByEmail("relja@gmail.com").Id, "canEdit"))
            {
                IdUserResult = userMgr.AddToRole(userMgr.FindByEmail("relja@gmail.com").Id, "canEdit");
            }


            /*
             Kada se pokrene aplikacija korisnik(admin) biva napraljen i moze se logovati
            sa njegovim nalogom. Provere gore ako admin ne postoji sluze za kada se aplikacija prvi put pokrece.
            Tada se pravi baza podataka korisnika i pravi se korisnik admin. Obicne korisnike pravimo
            putem registracije preko web forme. Ako aplikaciju ponovo pokrecemo admin-a tada vec imamo
            i kod u if-ovima se nece opet pokretati. Dakle, ovaj kod se pokrece uvek kada se aplikacija pokrene.
            Zasto? Jer je klasa RoleActions instancirana u Global.asax fajlu i tu je pozvan njem metod
            AddUserAndRole().
            Dalje pogledati:
            Account -> Students.aspx i Web.config
            Admin -> InsertStudent.aspx i Web.config
            Site Master
            Siste Master.cs
             */
        }
    }
}
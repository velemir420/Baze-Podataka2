using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using UserInterface.Model;

namespace UserInterface.ViewModel
{
    public class StudentskiDomViewModel : BindableBase
    {
        public MyICommand Create { get; private set; }
        public MyICommand Delete { get; private set; }
        public MyICommand Update { get; private set; }
        private List<stud_centar> studentskiCentri = new List<stud_centar>();
        private List<stud_dom> studentskiDomovi = new List<stud_dom>();
        private stud_dom selectedDom;
        private stud_centar selectedStudCentar;
        private string id;
        private string ime;
        private string brojSoba;

        public StudentskiDomViewModel()
        {
            Create = new MyICommand(OnCreate, CanCreate);
            Delete = new MyICommand(OnDelete, CanDelete);
            Update = new MyICommand(OnUpdate, CanUpdate);

            using (var db = new StudentskiCentarEntities())
            {
                StudentskiCentri = db.stud_centar.ToList();
                StudentskiDomovi = db.stud_dom.ToList();
            }
        }

        public stud_centar SelectedStudCentar
        {
            get
            {
                return selectedStudCentar;
            }
            set
            {
                selectedStudCentar = value;
                OnPropertyChanged("SelectedStudCentar");
                Create.RaiseCanExecuteChanged();
                Update.RaiseCanExecuteChanged();
            }
        }
        public List<stud_centar> StudentskiCentri{
            get
            {
                return studentskiCentri;
            }
            set
            {
                studentskiCentri = value;
                OnPropertyChanged("StudentskiCentri");
            }
        }

        public List<stud_dom> StudentskiDomovi
        {
            get
            {
                return studentskiDomovi;
            }
            set
            {
                studentskiDomovi = value;
                OnPropertyChanged("StudentskiDomovi");
            }
        }
        public stud_dom SelectedDom { get
            {
                return selectedDom;
            }
            set
            {
                selectedDom = value;
                if (SelectedDom != null) {
                    Id = SelectedDom.id_stud_dom.ToString();
                    Ime = SelectedDom.ime;
                    BrojSoba = SelectedDom.br_soba.ToString();
                }
                OnPropertyChanged("SelectedDom");
                Update.RaiseCanExecuteChanged();
                Delete.RaiseCanExecuteChanged();
            }
        }
        public string Id
        {
            get
            {
                return id;
            }
            set
            {
                id = value;
                OnPropertyChanged("Id");
                Create.RaiseCanExecuteChanged();
            }
        }
        public string Ime {
            get
            {
                return ime;
            }
            set
            {
                ime = value;
                OnPropertyChanged("Ime");
                Create.RaiseCanExecuteChanged();
            }
        }

        public string BrojSoba
        {
            get
            {
                return brojSoba;
            }
            set
            {
                brojSoba = value;
                OnPropertyChanged("BrojSoba");
                Create.RaiseCanExecuteChanged();
            }
        }



        public void OnCreate()
        {
            using (var db = new StudentskiCentarEntities())
            {
                int id = Int32.Parse(Id);
                stud_dom dom = db.stud_dom.Where(x => x.id_stud_dom == id).FirstOrDefault();
                if (dom == null)
                {
                    db.stud_dom.Add(new stud_dom() { id_stud_dom = id, ime = Ime, br_soba = Int32.Parse(BrojSoba), stud_centar_id_stud_centar = SelectedStudCentar.id_stud_centar});
                    db.SaveChanges();
                    MessageBox.Show("Uspesno ste uneli Studentski dom");
                    StudentskiDomovi = db.stud_dom.ToList();
                }
                else
                {
                    MessageBox.Show("Vec postoji dom sa isto ID-om");
                }
            }
        }

        public void OnDelete()
        {
            using (var db = new StudentskiCentarEntities())
            {
                try
                {
                    int id = SelectedDom.id_stud_dom;
                    stud_dom dom = db.stud_dom.Where(x => x.id_stud_dom == id).FirstOrDefault();

                    if (dom != null)
                    {
                        db.stud_dom.Remove(dom);
                        db.SaveChanges();
                        MessageBox.Show("Uspesno ste obrisali Studentski dom");
                        StudentskiDomovi = db.stud_dom.ToList();
                    }
                    else
                    {
                        MessageBox.Show("Dom sa ovim ID-om ne posotji");
                    }
                }
                catch
                {
                    MessageBox.Show("Greska pri brisanju odabranog entiteta");
                }
            }
            SelectedDom = StudentskiDomovi.FirstOrDefault();
        }
        public void OnUpdate()
        {
            using (var db = new StudentskiCentarEntities())
            {
                int id = SelectedDom.id_stud_dom;
                stud_dom dom = db.stud_dom.Where(x => x.id_stud_dom == id).FirstOrDefault();
                if (dom != null)
                {
                    dom.ime = Ime;
                    dom.stud_centar_id_stud_centar = SelectedStudCentar.id_stud_centar;
                    dom.br_soba = Int32.Parse(BrojSoba);
                    db.SaveChanges();
                    MessageBox.Show("Uspesno ste iymenili Studentski dom");
                    StudentskiDomovi = db.stud_dom.ToList();
                }
                else
                {
                    MessageBox.Show("Neuspesne izmene polja, uneti ID je postojeci u bazi");
                }
            }
        }
        public bool CanCreate()
        {
            if (!String.IsNullOrEmpty(Id) && !String.IsNullOrEmpty(Ime) && !String.IsNullOrEmpty(BrojSoba) && SelectedStudCentar != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool CanDelete()
        {
            if (SelectedDom != null) {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool CanUpdate()
        {
            if (!String.IsNullOrEmpty(Id) && !String.IsNullOrEmpty(Ime) && !String.IsNullOrEmpty(BrojSoba) && SelectedStudCentar != null && SelectedDom != null) {
                return true;
            }
            else{
                return false;
            }
        }

    }
}

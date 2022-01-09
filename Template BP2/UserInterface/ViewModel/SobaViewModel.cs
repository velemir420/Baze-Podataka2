using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using UserInterface.Model;

namespace UserInterface.ViewModel
{
    public class SobaViewModel : BindableBase
    {
        public MyICommand Create { get; private set; }
        public MyICommand Delete { get; private set; }
        public MyICommand Update { get; private set; }
        private List<soba> sobe = new List<soba>();
        private List<stud_dom> studentskiDomovi = new List<stud_dom>();
        private stud_dom selectedDom;
        private soba selectedSoba;
        private string id;
        private string brojSobe;

        public SobaViewModel()
        {
            Create = new MyICommand(OnCreate, CanCreate);
            Delete = new MyICommand(OnDelete, CanDelete);
            Update = new MyICommand(OnUpdate, CanUpdate);

            using (var db = new StudentskiCentarEntities())
            {
                Sobe = db.sobas.ToList();
                StudentskiDomovi = db.stud_dom.ToList();
            }
        }

        public List<soba> Sobe
        {
            get
            {
                return sobe;
            }
            set
            {
                sobe = value;
                OnPropertyChanged("Sobe");
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

        public stud_dom SelectedDom
        {
            get
            {
                return selectedDom;
            }
            set
            {
                selectedDom = value;
                OnPropertyChanged("SelectedDom");
                Update.RaiseCanExecuteChanged();
                Delete.RaiseCanExecuteChanged();
                Create.RaiseCanExecuteChanged();
            }
        }

        public soba SelectedSoba
        {
            get
            {
                return selectedSoba;
            }
            set
            {
                selectedSoba = value;
                if (SelectedSoba != null) {
                    Id = value.id_soba.ToString();
                    BrojSobe = value.broj.ToString();
                }

                OnPropertyChanged("SelectedSoba");
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

        public string BrojSobe
        {
            get
            {
                return brojSobe;
            }
            set
            {
                brojSobe = value;
                OnPropertyChanged("BrojSobe");
                Create.RaiseCanExecuteChanged();
            }
        }

        private bool CanUpdate()
        {
            if (!String.IsNullOrEmpty(Id) && !String.IsNullOrEmpty(BrojSobe) && SelectedDom != null && SelectedSoba != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private bool CanDelete()
        {
            if (SelectedSoba != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private void OnCreate()
        {
            using (var db = new StudentskiCentarEntities())
            {
                int id = Int32.Parse(Id);
                soba s = db.sobas.Where(x => x.id_soba == id).FirstOrDefault();

                if (s == null)
                {
                    db.sobas.Add(new soba() { id_soba = Int32.Parse(Id), broj = Int32.Parse(BrojSobe), stud_dom_id_stud_dom = SelectedDom.id_stud_dom});
                    db.SaveChanges();
                    MessageBox.Show("Uspesno ste uneli sobu u bazu");
                    Sobe = db.sobas.ToList();
                }
                else
                {
                    MessageBox.Show("Vec postoji soba sa unetim Id-om");
                }
            }
        }

        private void OnUpdate()
        {
            using (var db = new StudentskiCentarEntities())
            {
                soba s = db.sobas.Where(x => x.id_soba == SelectedSoba.id_soba).FirstOrDefault();

                if (s != null)
                {
                    s.id_soba = Int32.Parse(Id);
                    s.broj = Int32.Parse(BrojSobe);
                    s.stud_dom_id_stud_dom = SelectedDom.id_stud_dom;

                    db.SaveChanges();
                    MessageBox.Show("Uspesno ste izmenili informacije sobe u bazi");
                    Sobe = db.sobas.ToList();
                }
                else
                {
                    MessageBox.Show("Neuspesna izmena sobe, odabrana soba ne postoji");
                }
            }
        }

        private void OnDelete()
        {
            using (var db = new StudentskiCentarEntities())
            {
                try
                {
                    int id = SelectedSoba.id_soba;
                    soba s = db.sobas.Where(x => x.id_soba == id).FirstOrDefault();

                    if (s != null)
                    {
                        db.sobas.Remove(s);
                        db.SaveChanges();
                        MessageBox.Show("Uspesno ste obrisali sobu u bazu");
                        Sobe = db.sobas.ToList();
                    }
                    else
                    {
                        MessageBox.Show("Neuspesno brisanje sobe, odabrana soba ne postoji");
                    }
                }
                catch
                {
                    MessageBox.Show("Greska pri brisanju odabranog entiteta");
                }
            }
        }

        private bool CanCreate()
        {
            if (!String.IsNullOrEmpty(Id) && !String.IsNullOrEmpty(BrojSobe) && SelectedDom != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}

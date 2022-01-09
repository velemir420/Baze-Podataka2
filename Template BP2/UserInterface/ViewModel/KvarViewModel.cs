using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using UserInterface.Model;

namespace UserInterface.ViewModel
{
    public class KvarViewModel : BindableBase
    {
        public MyICommand Create { get; private set; }
        public MyICommand Delete { get; private set; }
        public MyICommand Update { get; private set; }
        private string id;
        private string opis;
        private List<kvar> kvarovi = new List<kvar>();
        private kvar selectedKvar;
        public KvarViewModel()
        {
            Create = new MyICommand(OnCreate, CanCreate);
            Delete = new MyICommand(OnDelete, CanDelete);
            Update = new MyICommand(OnUpdate, CanUpdate);

            using (var db = new StudentskiCentarEntities())
            {
                Kvarovi = db.kvars.ToList();
            }
        }

        public kvar SelectedKvar
        {
            get
            {
                return selectedKvar;
            }
            set
            {
                selectedKvar = value;
                if (SelectedKvar != null) {
                    Id = value.id_kvar.ToString();
                    Opis = value.opis.ToString();
                }
                OnPropertyChanged("SelectedKvar");
                Delete.RaiseCanExecuteChanged();
                Update.RaiseCanExecuteChanged();
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
                Delete.RaiseCanExecuteChanged();
                Update.RaiseCanExecuteChanged();
                Create.RaiseCanExecuteChanged();
            }
        }

        public string Opis
        {
            get
            {
                return opis;
            }
            set
            {
                opis = value;
                OnPropertyChanged("Opis");
                Delete.RaiseCanExecuteChanged();
                Update.RaiseCanExecuteChanged();
                Create.RaiseCanExecuteChanged();
            }
        }

        public List<kvar> Kvarovi
        {
            get
            {
                return kvarovi;
            }
            set
            {
                kvarovi = value;
                OnPropertyChanged("Kvarovi");
            }
        }

        private bool CanUpdate()
        {
            if (SelectedKvar != null && !String.IsNullOrEmpty(Id) && !String.IsNullOrEmpty(Opis))
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
            if (SelectedKvar != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private bool CanCreate()
        {
            if (!String.IsNullOrEmpty(Id) && !String.IsNullOrEmpty(Opis))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private void OnUpdate()
        {
            using (var db = new StudentskiCentarEntities())
            {
                kvar kv = db.kvars.Where(x => x.id_kvar == SelectedKvar.id_kvar).FirstOrDefault();

                if (kv != null)
                {
                    kv.opis = Opis;
                    db.SaveChanges();
                    MessageBox.Show("Uspesno izmenjen kvar u bazi");
                    Kvarovi = db.kvars.ToList();
                }
                else
                {
                    MessageBox.Show("Kvar ne postoji u bazi");
                }
            }
        }

        private void OnDelete()
        {
            using (var db = new StudentskiCentarEntities())
            {
                kvar kv = db.kvars.Where(x => x.id_kvar == SelectedKvar.id_kvar).FirstOrDefault();

                if (kv != null)
                {
                    db.kvars.Remove(kv);
                    db.SaveChanges();
                    MessageBox.Show("Uspesno obrisan kvar iz baze");
                    Kvarovi = db.kvars.ToList();
                }
                else
                {
                    MessageBox.Show("Kvar ne postoji u bazi");
                }
            }
        }

        private void OnCreate()
        {
            using (var db = new StudentskiCentarEntities())
            {
                int id = Int32.Parse(Id);
                kvar kv = db.kvars.Where(x => x.id_kvar == id).FirstOrDefault();

                if (kv == null)
                {
                    db.kvars.Add(new kvar() { id_kvar = Int32.Parse(Id), opis = Opis});
                    db.SaveChanges();
                    MessageBox.Show("Uspesno dodat kvar u bazu");
                    Kvarovi = db.kvars.ToList();
                }
                else
                {
                    MessageBox.Show("Uneti kvar vec postoji u bazi");
                }
            }
        }
    }
}

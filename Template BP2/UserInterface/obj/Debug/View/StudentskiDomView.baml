   M S B A M L   `   `   `  ����H  DUserInterface, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:UserInterface.ViewUserInterface.View  5      *    $UserInterface.View.StudentskiDomView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:UserInterface.View     5      .��5	      � .+�5
   
   �� $��Studentski domovi��6   $
��Left=�6,   $��42��6G   $��
270,10,0,0q�6S   $	��Top=�6g   $	��207��6   $
��Bold"�6�   $��20(�6�   &   System.Windows.Controls.DataGrid  5   
   $
��Left=�6       
IsReadOnly  .    SelectionMode$ Single=�6@      AutoGenerateColumns .  $	��244��6s   $��	10,66,0,0q�6�   $	��Top=�6�   $	��393��6�    �� SelectedItem 6�   �� *SelectedDom+��6�   �� *StudentskiDomovi+   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Id��6!      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6-   1  +System.Windows.Controls.DataGridBoundColumn   Binding 67   ��  �� Path$ id_stud_dom�6^     5      $	 Ime��6!   $ * 6.    68   �� $	 ime�6W     5      $ 	Broj Soba��6!   $ * 64    6>   �� $ br_soba�6a     5      $ Studentski centar��6!   $ * 6<    6F   �� $  stud_centar_id_stud_centar�6|   5      �� 5   
   $	��ID:��6   $
��Left=�6   $��43��69   $��
457,69,0,0q�6E   $	��Top=�6Y   $	��121��6q   $
��Bold"�6}   $��20(�6�   �� 5   
   $
��Ime:��6   $
��Left=�6   $��43��6:   $��457,112,0,0q�6F   $	��Top=�6[   $	��121��6s   $
��Bold"�6   $��20(�6�   �� 5   
   $��
Broj soba:��6   $
��Left=�6%   $��43��6@   $��457,155,0,0q�6L   $	��Top=�6a   $	��143��6y   $
��Bold"�6�   $��20(�6�   �� 5   
   $��Stud_centar ID:��6   $
��Left=�6*   $��43��6E   $��457,198,0,0q�6Q   $	��Top=�6f   $	��148��6~   $
��Bold"�6�   $��20(�6�   �� 5   
   -   5        	 ��Name$	 	IdTextBox��5      $
��Left=�6%   $��43��6b   $��
605,69,0,0q�6n   
 �� TextWrapping$

 Wrap=�6�   $	��Top=�6�   $	��185��6�   $
��Bold"�6�   $��20(�6�   ��6@   �� *Id+ �� Mode$ TwoWay=�6�   �� 5   
   -   5        $	 
ImeTextBox��5      $
��Left=�6&   $��43��6c   $��605,112,0,0q�6o   $

 Wrap=�6�   $	��Top=�6�   $	��185��6�   $
��Bold"�6�   $��20(�6�   ��6A   �� *Ime+$ TwoWay=�6�   �� 5   
   -   5        $	 BrSobaTextBox��5      $
��Left=�6)   $��43��6k   $��605,150,0,0q�6w   $

 Wrap=�6�   $	��Top=�6�   $	��185��6�   $
��Bold"�6�   $��20(�6�   ��6D   �� *
BrojSoba+$ TwoWay=�6�   �� 5   
   $��Create��6   $
��Left=�6"   $��26��6X   $��
36,344,0,0q�6d   $	��Top=�6x   $	��161��6�   ��6=   �� *Create+6�   �� 5   
   $��Delete��6   $
��Left=�6"   $��26��6X   $��288,344,0,0q�6d   $	��Top=�6y   $	��161��6�   ��6=   �� *Delete+6�   �� 5      $��Update��6   $
��Left=�6&   $��26��6\   $��534,344,0,0q�6h   $	��Top=�6}   $	��161��6�   ��6A   �� *Update+6�   �� 5   
   -   5         ��Name$ StudCentarIdList��5      $
��Left=�6-   $	��112��6�   $��605,198,0,0q�6�   $	��Top=�6�   $	��195��6�    6H   �� *SelectedStudCentar+��6t   �� $ StudentskiCentri� �� View 5      �� 5      .P�5       �� $��ID��6%    �� DisplayMemberBinding 61   �� $ id_stud_centar��� 5!      $	��Ime��6%    62   �� $	 ime�5"      5$      5%      5&      
   M S B A M L   `   `   `  ����H  DUserInterface, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:UserInterface.ViewUserInterface.View  5      $    UserInterface.View.StudentView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:UserInterface.View     5      .��5	      � .+�5
   
   �� $��Studenti��6   $
��Left=�6#   $��42��6>   $��
270,10,0,0q�6J   $	��Top=�6^   $	��207��6v   $
��Bold"�6�   $��20(�6�   &   System.Windows.Controls.DataGrid  5   
   $
��Left=�6       
IsReadOnly  .    SelectionMode$ Single=�6@      AutoGenerateColumns .  $	��244��6s   $��	10,66,0,0q�6�   $	��Top=�6�   $	��393��6�    �� SelectedItem 6�   �� *SelectedStudent+��6�   �� *
Studenti+   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$
 JMBG��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 63   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6=   ��  �� Path$
 jmbg�6]     5      $	 Ime��6%   $ * 62    6<   �� $	 ime�6[     5      $ Prezime��6%   $ * 66    6@   �� $ prezime�6c   5      �� 5   
   $��JMBG:��6   $
��Left=�6    $��43��6;   $��
457,69,0,0q�6G   $	��Top=�6[   $	��121��6s   $
��Bold"�6   $��20(�6�   �� 5   
   $
��Ime:��6   $
��Left=�6   $��43��6:   $��457,112,0,0q�6F   $	��Top=�6[   $	��121��6s   $
��Bold"�6   $��20(�6�   �� 5   
   $��Prezime:��6   $
��Left=�6#   $��43��6>   $��457,155,0,0q�6J   $	��Top=�6_   $	��143��6w   $
��Bold"�6�   $��20(�6�   �� 5   
   -   5        	 ��Name$	 	IdTextBox��5      $
��Left=�6%   $��43��6d   $��
605,69,0,0q�6p   
 �� TextWrapping$

 Wrap=�6�   $	��Top=�6�   $	��185��6�   $
��Bold"�6�   $��20(�6�   ��6@   �� *JMBG+ �� Mode$ TwoWay=�6�   �� 5   
   -   5        $	 
ImeTextBox��5      $
��Left=�6&   $��43��6c   $��605,112,0,0q�6o   $

 Wrap=�6�   $	��Top=�6�   $	��185��6�   $
��Bold"�6�   $��20(�6�   ��6A   �� *Ime+$ TwoWay=�6�   �� 5   
   -   5        $	 BrSobaTextBox��5      $
��Left=�6)   $��43��6j   $��605,150,0,0q�6v   $

 Wrap=�6�   $	��Top=�6�   $	��185��6�   $
��Bold"�6�   $��20(�6�   ��6D   �� *	Prezime+$ TwoWay=�6�   �� 5   
   $��Create��6   $
��Left=�6"   $��26��6X   $��
36,344,0,0q�6d   $	��Top=�6x   $	��161��6�   ��6=   �� *Create+6�   �� 5   
   $��Delete��6   $
��Left=�6"   $��26��6X   $��288,344,0,0q�6d   $	��Top=�6y   $	��161��6�   ��6=   �� *Delete+6�   �� 5   
   $��Update��6   $
��Left=�6"   $��26��6X   $��534,344,0,0q�6d   $	��Top=�6y   $	��161��6�   ��6=   �� *Update+6�   5      5      
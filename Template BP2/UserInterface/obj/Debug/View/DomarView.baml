   M S B A M L   `   `   `  ����H  DUserInterface, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:UserInterface.ViewUserInterface.View  5      "    UserInterface.View.DomarView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:UserInterface.View     5      .��5	      � .+�5
   
   �� $��Domar��6   $
��Left=�6    $��42��6;   $��
270,10,0,0q�6G   $	��Top=�6[   $	��207��6s   $
��Bold"�6   $��20(�6�   &   System.Windows.Controls.DataGrid  5   
   $
��Left=�6       
IsReadOnly  .    SelectionMode$ Single=�6@      AutoGenerateColumns .  $	��244��6s   $��	10,66,0,0q�6�   $	��Top=�6�   $	��393��6�    �� SelectedItem 6�   �� *SelectedDomar+��6�   �� *Domari+   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Id��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 61   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6;   ��  �� Path$ 	id_radnik�6`     5      $ Licenca��6%   $ * 66    6@   �� $ licenca�6c   5      �� 5   
   $	��ID:��6   $
��Left=�6   $��43��69   $��
457,69,0,0q�6E   $	��Top=�6Y   $	��121��6q   $
��Bold"�6}   $��20(�6�   �� 5   
   $��Licenca:��6   $
��Left=�6#   $��43��6>   $��457,168,0,0q�6J   $	��Top=�6_   $	��121��6w   $
��Bold"�6�   $��20(�6�   �� 5   
   -   5        	 ��Name$	 
ImeTextBox��5      $
��Left=�6&   $��43��6g   $��556,168,0,0q�6s   
 �� TextWrapping$

 Wrap=�6�   $	��Top=�6�   $	��234��6�   $
��Bold"�6�   $��20(�6�   ��6A   �� *	Licenca+ �� Mode$ TwoWay=�6�   �� 5   
   $��Create��6   $
��Left=�6"   $��26��6X   $��
36,344,0,0q�6d   $	��Top=�6x   $	��161��6�   ��6=   �� *Create+6�   �� 5   
   $��Delete��6   $
��Left=�6"   $��26��6X   $��288,344,0,0q�6d   $	��Top=�6y   $	��161��6�   ��6=   �� *Delete+6�   �� 5   
   $��Update��6   $
��Left=�6"   $��26��6X   $��534,344,0,0q�6d   $	��Top=�6y   $	��161��6�   ��6=   �� *Update+6�   �� 5   
   $
��Left=�6   $	��102��6.   $��
556,66,0,0q�6;   $	��Top=�6�   $	��234��6�   ��6O   �� *	Radnici+ 6o   �� *SelectedRadnik+ �� View 5      �� 5      .P�5      �� $��ID��6%    �� DisplayMemberBinding 61   �� $ id_stud_dom��� 5      $	��Ime��6%    62   �� $	 ime�5      5      5      5       
   M S B A M L   `   `   `  ����H  DUserInterface, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:UserInterface.ViewUserInterface.View  5      !    UserInterface.View.KvarView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:UserInterface.View     5      .��5	      � .+�5
   
   �� $��Kvarovi��6   $
��Left=�6"   $��42��6=   $��
270,10,0,0q�6I   $	��Top=�6]   $	��207��6u   $
��Bold"�6�   $��20(�6�   &   System.Windows.Controls.DataGrid  5   
   $
��Left=�6       
IsReadOnly  .    SelectionMode$ Single=�6@      AutoGenerateColumns .  $	��244��6s   $��	10,66,0,0q�6�   $	��Top=�6�   $	��393��6�    �� SelectedItem 6�   �� *SelectedKvar+��6�   �� *	Kvarovi+   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Id��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 61   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6;   ��  �� Path$ id_kvar�6^     5      $
 Opis��6%   $ * 63    6=   �� $
 opis�6]   5      �� 5   
   $	��ID:��6   $
��Left=�6   $��43��69   $��
457,69,0,0q�6E   $	��Top=�6Y   $	��121��6q   $
��Bold"�6}   $��20(�6�   �� 5   
   $��Opis:��6   $
��Left=�6    $��43��6;   $��457,112,0,0q�6G   $	��Top=�6\   $	��121��6t   $
��Bold"�6�   $��20(�6�   �� 5   
   -   5        	 ��Name$	 	IdTextBox��5      $
��Left=�6%   $��43��6b   $��
556,69,0,0q�6n   
 �� TextWrapping$

 Wrap=�6�   $	��Top=�6�   $	��234��6�   $
��Bold"�6�   $��20(�6�   ��6@   �� *Id+ �� Mode$ TwoWay=�6�   �� 5   
   -   5        $	 
ImeTextBox��5      $
��Left=�6&   $	��154��6d   $��556,112,0,0q�6q   $

 Wrap=�6�   $	��Top=�6�   $	��234��6�   $
��Bold"�6�   $��20(�6�   ��6A   �� *Opis+$ TwoWay=�6�   �� 5   
   $��Create��6   $
��Left=�6"   $��26��6X   $��
36,344,0,0q�6d   $	��Top=�6x   $	��161��6�   ��6=   �� *Create+6�   �� 5   
   $��Delete��6   $
��Left=�6"   $��26��6X   $��288,344,0,0q�6d   $	��Top=�6y   $	��161��6�   ��6=   �� *Delete+6�   �� 5   
   $��Update��6   $
��Left=�6"   $��26��6X   $��534,344,0,0q�6d   $	��Top=�6y   $	��161��6�   ��6=   �� *Update+6�   5      5      
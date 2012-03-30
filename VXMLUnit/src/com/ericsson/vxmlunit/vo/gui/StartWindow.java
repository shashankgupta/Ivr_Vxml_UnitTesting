package com.ericsson.vxmlunit.vo.gui;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JRadioButton;
import java.awt.BorderLayout;
import javax.swing.JButton;
import javax.swing.JTabbedPane;
import com.sun.java.swing.plaf.windows.resources.windows;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

public class StartWindow {

	private JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					StartWindow window = new StartWindow();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
			}
		});
	}

	/**
	 * Create the application.
	 */
	public StartWindow() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 450, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JRadioButton rdbtnNewRadioButton = new JRadioButton("Test Balance Inquiry");
		rdbtnNewRadioButton.setBounds(154, 123, 158, 23);
		frame.getContentPane().add(rdbtnNewRadioButton);
		
		JButton btnRunTest = new JButton("Run Test");
		btnRunTest.setBounds(168, 183, 99, 29);
		frame.getContentPane().add(btnRunTest);
		
		JRadioButton rdbtnNewRadioButton_1 = new JRadioButton("Test Case Sample");
		rdbtnNewRadioButton_1.setBounds(0, 123, 142, 23);
		frame.getContentPane().add(rdbtnNewRadioButton_1);
		
		JRadioButton rdbtnNewRadioButton_2 = new JRadioButton("Custom Path");
		rdbtnNewRadioButton_2.setBounds(320, 123, 112, 23);
		frame.getContentPane().add(rdbtnNewRadioButton_2);
	}
	
	public void actionPerformed(ActionEvent e){
		String command = e.getActionCommand();
		System.out.println(command + "command run ho gaye!!!!!!!");
	}
	
}

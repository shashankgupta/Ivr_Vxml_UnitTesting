package com.ericsson.vxmlunit.vo.gui;

import java.awt.EventQueue;

import javax.swing.JFrame;

import com.ericsson.vxmlunit.Tests.TestBalInq.MainFormBalanceEnquiry;
//import com.jgoodies.forms.layout.FormLayout;
//import com.jgoodies.forms.layout.ColumnSpec;
//import com.jgoodies.forms.layout.RowSpec;
//import com.jgoodies.forms.factories.FormFactory;
import javax.swing.JLabel;
import java.awt.GridBagLayout;
import javax.swing.JButton;
import java.awt.GridBagConstraints;
import javax.swing.JRadioButton;
import java.awt.Insets;
import java.awt.FlowLayout;

import javax.swing.JFileChooser;
import javax.swing.JPanel;
import javax.swing.SwingConstants;
import javax.swing.JSeparator;
import javax.swing.JTextField;
import javax.swing.JTextArea;

import org.junit.internal.builders.JUnit4Builder;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.File;

import junit.framework.JUnit4TestAdapter;

public class StartWindow implements ActionListener{

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
	public JButton btnLoadVxml = new JButton("LOAD VXML");
	JButton btnRunTest = new JButton("RUN TEST");
	public JTextArea LogTextArea = new JTextArea();
	MainFormBalanceEnquiry mfb;
	
	public void initialize() {
		mfb = new MainFormBalanceEnquiry();
		frame = new JFrame();
		frame.setBounds(100, 100, 739, 487);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JLabel lblDisplayLogs = new JLabel("DISPLAY LOGS");
		lblDisplayLogs.setHorizontalAlignment(SwingConstants.CENTER);
		lblDisplayLogs.setBounds(87, 86, 236, 16);
		frame.getContentPane().add(lblDisplayLogs);
		
		JButton btnGrammar = new JButton("GRAMMAR");
		btnGrammar.setBounds(616, 156, 117, 29);
		frame.getContentPane().add(btnGrammar);
		
//		btnLoadVxml = new JButton("LOAD VXML");
		btnLoadVxml.addActionListener(this);
		btnLoadVxml.setBounds(616, 115, 117, 29);
		frame.getContentPane().add(btnLoadVxml);
		
		JButton btnExit = new JButton("EXIT");
		btnExit.setBounds(616, 430, 117, 29);
		frame.getContentPane().add(btnExit);
		
		JButton btnSaveLogs = new JButton("SAVE LOGS");
		btnSaveLogs.setBounds(616, 395, 117, 29);
		frame.getContentPane().add(btnSaveLogs);
		
//		JButton btnRunTest = new JButton("RUN TEST");
		btnRunTest.addActionListener(this);
		btnRunTest.setBounds(616, 274, 117, 29);
		frame.getContentPane().add(btnRunTest);
		
//		LogTextArea = new JTextArea();
		LogTextArea.setBounds(6, 115, 598, 344);
		frame.getContentPane().add(LogTextArea);
	}

	public void actionPerformed(ActionEvent e) {
		
		
		if(e.getSource() == btnLoadVxml){
			JFileChooser fc = new JFileChooser();
			File dir = new File("/Library/tomcat/webapps/vxmlscript/");
			fc.setCurrentDirectory(dir);
			int returnVal = fc.showOpenDialog(btnLoadVxml);
			if (returnVal == JFileChooser.APPROVE_OPTION) {
				
				
		        File file = fc.getSelectedFile();
		        String path = file.getAbsolutePath();
		        //This is where a real application would open the file.
		       // mfb.setFilepath(path);
		        MainFormBalanceEnquiry.filepath=path;
		        LogTextArea.append("VXML File Loaded : " + file.getName() + ".bo" + "\n");
		        LogTextArea.append("Absolute Path : " + file.getAbsolutePath() + "\n");
		        
		      } else {
		    	LogTextArea.append("Open command cancelled by user." + "\n");
		      }
		}
		
		if(e.getSource() == btnRunTest) {
			try {
				Result result = JUnitCore.runClasses(MainFormBalanceEnquiry.class);
				
				for(Failure failure : result.getFailures()) {
					
					LogTextArea.append(failure.toString());
				}
				
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
	
//	public void setLog(String appendText) {
//		LogTextArea.append(appendText + "\n");
//	}
}

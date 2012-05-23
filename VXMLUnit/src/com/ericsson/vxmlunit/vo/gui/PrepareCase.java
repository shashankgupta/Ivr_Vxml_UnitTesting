package com.ericsson.vxmlunit.vo.gui;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JButton;
import javax.swing.JOptionPane;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JLabel;
import javax.swing.JTree;
import javax.swing.event.PopupMenuListener;
import javax.swing.event.TreeSelectionListener;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;

public class PrepareCase implements ActionListener {

	private JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					PrepareCase window = new PrepareCase();
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
	public PrepareCase() {
		initialize();
	}

	JButton btnNewButton = new JButton("New button");
	JTree tree;
	private void initialize() {
		
		frame = new JFrame();
		frame.setBounds(100, 100, 562, 411);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		KeyValues root = new KeyValues("Root" , "1");
		KeyValues child = new KeyValues("1234" , "2");
		KeyValues grandChild = new KeyValues("9876" , "3");

		
		tree = new JTree(root);
		tree.setBounds(6, 6, 375, 254);
		frame.getContentPane().add(tree);

		root.add(child);
		child.add(grandChild);
		
		btnNewButton.addActionListener(this);
		btnNewButton.setBounds(29, 272, 117, 29);
		frame.getContentPane().add(btnNewButton);

	}

	public void actionPerformed(ActionEvent e) {
		if(e.getSource() == btnNewButton) {
			KeyValues node = (KeyValues) tree.getLastSelectedPathComponent();
			String ID = node.getId();
			String value = node.getValue();
			
			System.out.println(ID);
			System.out.println(value);
		}
	}
}

class KeyValues extends DefaultMutableTreeNode{
	private String id,value;

	//constructor
	public KeyValues(String id,String val) {
		super(val);
		this.id = id;
		this.value = val;
	}

	//get id
	public String getId(){
		return this.id;
	}

	//get value
	public String getValue(){
		return this.value;
	}
}

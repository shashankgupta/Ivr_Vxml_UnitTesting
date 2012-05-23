package com.ericsson.vxmlunit.vo.gui;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.tree.*;
 
public class TreePopup {
	
    private JScrollPane getTreeComponent() {
        JTree tree = new JTree();
        tree.setEditable(true);
        PopupHandler handler = new PopupHandler(tree);
        tree.add(handler.getPopup());
        expand(tree, new TreePath(tree.getModel().getRoot()));
        return new JScrollPane(tree);
    }
 
    private void expand(JTree tree, TreePath path) {
        TreeNode node = (TreeNode)path.getLastPathComponent();
        if (node.getChildCount() >= 0) {
            java.util.Enumeration e = node.children();
            while(e.hasMoreElements()) {
                TreeNode n = (TreeNode)e.nextElement();
                expand(tree, path.pathByAddingChild(n));
            }
        }
        tree.expandPath(path);
    }
 
    public static void main(String[] args) {
        TreePopup test = new TreePopup();
        JFrame f = new JFrame();
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        f.add(test.getTreeComponent());
        f.setSize(400,400);
        f.setLocation(200,200);
        f.setVisible(true);
    }
}
 
class PopupHandler implements ActionListener,
                              PopupMenuListener {
    JTree tree;
    JPopupMenu popup;
    JMenuItem item;
    boolean overRoot = false;
    Point loc;
 
    public PopupHandler(JTree tree) {
        this.tree = tree;
        popup = new JPopupMenu();
        popup.setInvoker(tree);
        JMenu menu = new JMenu("insert");
        popup.add(menu);
        menu.add(getMenuItem("add child"));
        menu.add(item = getMenuItem("add sibling"));
        tree.addMouseListener(ma);
        popup.addPopupMenuListener(this);
    }
 
    private JMenuItem getMenuItem(String s) {
        JMenuItem menuItem = new JMenuItem(s);
        menuItem.setActionCommand(s.toUpperCase());
        menuItem.addActionListener(this);
        return menuItem;
    }
 
    public JPopupMenu getPopup() {
        return popup;
    }
 
    public void actionPerformed(ActionEvent e) {
        String ac = e.getActionCommand();
        TreePath path  = tree.getPathForLocation(loc.x, loc.y);
        //System.out.println("path = " + path);
        //System.out.printf("loc = [%d, %d]%n", loc.x, loc.y);
        if(ac.equals("ADD CHILD"))
            addChild(path);
        if(ac.equals("ADD SIBLING"))
            addSibling(path);
    }
 
    private void addChild(TreePath path) {
        DefaultMutableTreeNode parent =
            (DefaultMutableTreeNode)path.getLastPathComponent();
        int count = parent.getChildCount();
        DefaultMutableTreeNode child =
            new DefaultMutableTreeNode("child " + count);
        DefaultTreeModel model = (DefaultTreeModel)tree.getModel();
        model.insertNodeInto(child, parent, count);
    }
 
    private void addSibling(TreePath path) {
        DefaultMutableTreeNode node =
            (DefaultMutableTreeNode)path.getLastPathComponent();
        DefaultMutableTreeNode parent =
            (DefaultMutableTreeNode)node.getParent();
        int count = parent.getChildCount();
        DefaultMutableTreeNode child =
            new DefaultMutableTreeNode("child " + count);
        DefaultTreeModel model = (DefaultTreeModel)tree.getModel();
        model.insertNodeInto(child, parent, count);
    }
 
    private MouseListener ma = new MouseAdapter() {
        private void checkForPopup(MouseEvent e) {
            if(e.isPopupTrigger()) {
                loc = e.getPoint();
                TreePath path  = tree.getPathForLocation(loc.x, loc.y);
                //System.out.printf("path = %s%n", path);
                if(path == null) {
                    e.consume();
                    return;
                }
                TreeNode root = (TreeNode)tree.getModel().getRoot();;
                overRoot = path.getLastPathComponent() == root;
                popup.show(tree, loc.x, loc.y);
            }
        }
 
        public void mousePressed(MouseEvent e)  { checkForPopup(e); }
        public void mouseReleased(MouseEvent e) { checkForPopup(e); }
        public void mouseClicked(MouseEvent e)  { checkForPopup(e); }
    };
  
    public void popupMenuWillBecomeVisible(PopupMenuEvent e) {
        item.setVisible(!overRoot);
    }
 
    public void popupMenuCanceled(PopupMenuEvent e) {}
    public void popupMenuWillBecomeInvisible(PopupMenuEvent e) {}
}
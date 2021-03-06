package actions;

import org.eclipse.jface.action.Action;
import org.eclipse.jface.viewers.TreeViewer;
import org.eclipse.jface.window.Window;

import dialogs.MessageDialogEVLMessage;
import model.EVL_Tree_Container;
import model.EVL_Tree_Context_Item;
import model.EVL_Tree_Root;
import model.EVL_Tree_Message;

/**
 * It allows to add the Message (quotes must be inserted manually)
 *
 */
public class Add_Message_to_EVL extends Action{

	TreeViewer EVLtree;
	EVL_Tree_Container containerSelected;
	
	/**
	 * @param tree The EVL TreeViewer
	 * @param s The Constraint or Critique to which the Message will be added
	 */
	public Add_Message_to_EVL(TreeViewer tree, EVL_Tree_Container s) {
		this.EVLtree = tree;
		this.containerSelected = s;
	}

	public void run() {

		String txtMsg = "";
		MessageDialogEVLMessage dialogMessage = new MessageDialogEVLMessage(EVLtree.getControl().getShell());
		dialogMessage.create();
		if (dialogMessage.open() == Window.OK) {
			txtMsg = dialogMessage.getName();

		} else {
			return;
		}

		EVL_Tree_Message msg = new EVL_Tree_Message(txtMsg);
		for (EVL_Tree_Context_Item c : ((EVL_Tree_Root)EVLtree.getInput()).getContextList()) {
			if (c.getName().equals(containerSelected.getContext())) {
				for (EVL_Tree_Container container : c.getContainers()) {
					if (container.equals(containerSelected)) {
						container.setMessage(msg);
					}
				}
			}
		}
		
		Object[] ex = EVLtree.getExpandedElements();
		EVLtree.refresh();
		EVLtree.setExpandedElements(ex);
		EVLtree.setExpandedState(containerSelected, true);
	}
}

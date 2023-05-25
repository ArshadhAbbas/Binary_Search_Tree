class Node {
  int data;
  Node? left;
  Node? right;
  Node(this.data);
}

class Bst {
  Node? root;

  void insert(int data) {
    Node? current = root;
    if (root == null) {
      root = Node(data);
      return;
    }
    while (true) {
      if (data < current!.data) {
        if (current.left == null) {
          current.left = Node(data);
          break;
        } else {
          current = current.left;
        }
      } else {
        if (current.right == null) {
          current.right = Node(data);
          break;
        } else {
          current = current.right;
        }
      }
    }
  }

  void delete(int data) {
    _deleteNode(root, data);
  }

  Node? _deleteNode(Node? node, int data) {
    if (node == null) {
      return null;
    }
    if (data < node.data) {
      node.left = _deleteNode(node.left, data);
    } else if (data > node.data) {
      node.right = _deleteNode(node.right, data);
    } else {
      if (node.left == null && node.right == null) {
        return null;
      } else if (node.left == null) {
        return node.right;
      } else if (node.right == null) {
        return node.left;
      } else {
        Node? temp = findMin(node.right);
        node.data = temp!.data;
        node.right = _deleteNode(node.right, temp.data);
      }
    }
    return node;
  }

  Node? findMin(Node? node) {
    while (node != null && node.left != null) {
      node = node.left;
    }
    return node;
  }

  void inorder() {
    _inorder(root);
  }

  void _inorder(Node? node) {
    if (node != null) {
      _inorder(node.left);
      print(node.data);
      _inorder(node.right);
    }
  }

  void preorder() {
    _preorder(root);
  }

  _preorder(Node? node) {
    if (node != null) {
      print(node.data);
      _preorder(node.left);
      _preorder(node.right);
    }
  }

  void postorder() {
    _postorder(root);
  }

  void _postorder(Node? node) {
    if (node != null) {
      _postorder(node.left);
      _postorder(node.right);
      print(node.data);
    }
  }

  bool contains(int data) {
    Node? current = root;
    while (current != null) {
      if (data < current.data) {
        current = current.left;
      } else if (data > current.data) {
        current = current.right;
      } else {
        return true;
      }
    }
    return false;
  }

  bool isBst(Node? node) {
    if (node == null) {
      return true;
    }
    return (node.left == null || node.left!.data < node.data) &&
        (node.right == null || node.right!.data > node.data) &&
        isBst(node.left) &&
        isBst(node.right);
  }

  void smallest()
  {
    Node? node=root;
    while(node!=null)
    {
      if(node.left==null)
      {
        print(node.data);
        return;
      }
      node=node.left;
    }
  }

  void largest()
  {
    Node? node=root;
    while(node!=null)
    {
      if(node.right==null)
      {
        print(node.data);
        return;
      }
      node=node.right;
    }
  }
}

void main() {
  Bst tree = Bst();
  tree.insert(23);
  tree.insert(87);
  tree.insert(1);
  tree.insert(6);
  tree.insert(2);
  tree.insert(4);
  tree.insert(14);
  print("Inorder traversal");
  tree.inorder();
  tree.delete(87);
  print("Preorder traversal after removing a node");
  tree.preorder();
  print("Postorder traversal");
  tree.postorder();
  print("If the tree BST or not");
  print(tree.isBst(tree.root));
  print("Smallest element");
  tree.smallest();
  print("Largest element");
  tree.largest();
}

// class Node
// {
//   int data;
//   Node? right;
//   Node? left;
//   Node(this.data);
// }

// class bst
// {
//   Node? root;

//   void insert(int data)
//   {
//     if(root==null)
//     {
//       root=Node(data);
//       return;
//     }
//     Node? current=root;
//     while(true)
//     {
//       if(data<current!.data)
//       {
//         if(current.left==null)
//         {
//           current.left=Node(data);
//           return;
//         }
//         current=current.left;
//       }
//       else{
//         if(current.right==null)
//         {
//           current.right=Node(data);
//           return;
//         }
//         current=current.right;
//       }
//     }
//   }

//   void delete(int data)
//   {
//     _delete(root,data);
//   }
//   Node? _delete(Node? node,int data)
//   {
//     if(node==null)
//     {
//       return null;
//     }
//     if(data<node.data)
//     {
//       node.left=_delete(node.left, data);
//     }
//     else if(data>node.data)
//     {
//       node.right=_delete(node.right, data);
//     }
//     else
//     {
//       if(node.left == null || node.right==null)
//       {
//         return null; 
//       }
//       else if(node.left==null)
//       {
//         return node.right;
//       }
//       else if(node.right==null)
//       {
//         return node.left;
//       }
//       else
//       {
//         Node? temp=findMin(node.right);
//         node.data=temp!.data;
//         node.right=_delete(node.right, temp.data);
//       }
      
//     }
//     return node;
//   }
//   Node? findMin(Node? node)
//   {
//     while(node!=null && node.left!=null)
//     {
//       node=node.left;
//     }
//     return node;
//   }
// }
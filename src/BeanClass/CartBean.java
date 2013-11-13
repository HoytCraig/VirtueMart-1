
package BeanClass;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


public class CartBean implements Serializable {
    private List cartList;
    private ItemBean item;
    private int size;
    public CartBean(){
    cartList=new ArrayList();
    }

    /**
     * @return the Cart
     */
    public List getCartList() {
        return cartList;
    }

    public void setCartList(List Cart) {
        this.cartList = Cart;
    }

    /**
     * @return the item
     */
    public ItemBean getItem() {
        return item;
    }

    /**
     * @param item the item to set
     */
    public void setItem(ItemBean item) {
        cartList.add(item);
    }

    /**
     * @return the size
     */
    public int getSize() {
       if(cartList==null)size=0;
       
        return size;
    }

    /**
     * @param size the size to set
     */
    public void setSize(int size) {
        this.size = size;
    }

    /**
     * @return the item
     */
  
    
}

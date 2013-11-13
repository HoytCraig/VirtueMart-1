/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package BeanClass;

import java.io.Serializable;

/**
 *
 * @author Administrator
 */
public class ItemBean implements Serializable {
private int id;
    private String name;
    private String desc;
    private Double rate;
    private int disc;
    private int quantity;
    private Double price;
public ItemBean(/*String name, String desc, Double rate, Double disc*/){
/*this.name=name;
this.desc=desc;
this.rate=rate;
this.disc=disc;*/
}

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the desc
     */
    public String getDesc() {
        return desc;
    }

    /**
     * @param desc the desc to set
     */
    public void setDesc(String desc) {
        this.desc = desc;
    }

    /**
     * @return the rate
     */
    public Double getRate() {
        return rate;
    }

    /**
     * @param rate the rate to set
     */
    public void setRate(Double rate) {
        this.rate = rate;
    }

    /**
     * @return the disc
     */
    public int getDisc() {
        return disc;
    }

    /**
     * @param disc the disc to set
     */
    public void setDisc(int disc) {
        this.disc = disc;
    }

    /**
     * @return the price
     */
    public Double getPrice() {
       
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}

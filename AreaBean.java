/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package meupacote;

/**
 *
 * @author Marcos
 */
public class AreaBean {
    private int area=0;

    public void setArea(int b, int a)
    {
        this.area=(b*a)/2;
    }
    public int getArea()
    {
        return area;
    }
}

package net.antidot.semantic.rdf.rdb2rdf.main;
/*
 * HiloTime.java
 *
 * Created on 17 de diciembre de 2013, 16:48
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

import javax.swing.JLabel;

/**
 *
 * @author Kathrin
 */
public class HiloTime extends Thread {

    private JLabel p;
    private String d = "0", h = "0", m = "0", s = "0";

    /** Creates a new instance of HiloTime */
    public HiloTime(JLabel p) {
        this.p = p;
    }

    @Override
    public void run() {
        int contd = 0;
        int conth = 0;
        int contm = 0;
        int conts = 0;

        while (true) {
            try {
                Thread.sleep(1000);
            } catch (InterruptedException ex) {

            }

            if (conts + 1 == 60) {
                conts = 0;
                if (contm + 1 == 60) {
                    contm = 0;
                    if (conth + 1 == 24) {
                        conth = 0;
                        contd++;
                    } else {
                        conth++;
                    }
                } else {
                    contm++;
                }
            } else {
                conts++;
            }

            if (contd < 10) {
                d = "0" + Integer.toString(contd);
            } else {
                d = Integer.toString(contd);
            }

            if (conth < 10) {
                h = "0" + Integer.toString(conth);
            } else {
                h = Integer.toString(conth);
            }

            if (contm < 10) {
                m = "0" + Integer.toString(contm);
            } else {
                m = Integer.toString(contm);
            }

            if (conts < 10) {
                s = "0" + Integer.toString(conts);
            } else {
                s = Integer.toString(conts);
            }

            p.setText(d+" "+ "Days " + h + " : " + m + " : " + s);
        }

    }

    public String getTime() {
        return d+" "+ "Days " + h + " : " + m + " : " + s;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import es.albarregas.beans.Libro;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.beanutils.BeanUtils;


@WebServlet(name = "ControladorInsertar", urlPatterns = {"/ControladorInsertar"})
public class ControladorInsertar extends HttpServlet {

    Libro[] listaLibros = new Libro[5];
    String url = "/JSP/escogerLibros.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("ENTRO EN PROCESSREQUEST");
        HttpSession sesion = request.getSession(true);
        Libro libro = new Libro();
        int ningunoEscogido = 0;
        try {
            BeanUtils.populate(libro, request.getParameterMap());

        } catch (IllegalAccessException ex) {
            ex.getStackTrace();
        } catch (InvocationTargetException ex) {
            ex.getStackTrace();
        }
        
        if (request.getParameter("insertar") != null && request.getParameterValues("nombre") != null) {
            System.out.println("Entro en insertar");
            for (int i = 0; i < listaLibros.length; i++) {
                if (listaLibros[i].getNombre().equals(libro.getNombre()) && listaLibros[i].getCantidad() != 0) {
                    //Si el libro introducido, ya lo ha sido anteriormente, solo modifica la cantidad
                    listaLibros[i].setCantidad(listaLibros[i].getCantidad() + libro.getCantidad());
                    System.out.println("Entro a modificar la cantidad que quiere de este libro");
                } else if (listaLibros[i].getNombre().equals(libro.getNombre()) && listaLibros[i].getCantidad() == 0) {
                    listaLibros[i] = libro;
                    System.out.println("Entro a insertar la cantidad que quiere de este libro");
                }
            }
            url = "/JSP/escogerLibros.jsp";
            sesion.setAttribute("arrayLibros", listaLibros);
        } else if (request.getParameter("finalizar") != null){
            for(int i = 0;i<listaLibros.length;i++){
                if(listaLibros[i].getCantidad() == 0){
                    ningunoEscogido = ningunoEscogido + 1;
                }
                
                if(ningunoEscogido == 5){
                    String error = "No se ha escogido ningún libro";
                    request.setAttribute("error", error);
                }
            }
            
            url = "/JSP/finalizar.jsp";
        }

        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        url = "/JSP/escogerLibros.jsp";
        
        Libro libro1 = new Libro("nombreDelViento", 0);
        Libro libro2 = new Libro("seniorAnillos", 0);
        Libro libro3 = new Libro("reyDemonio", 0);
        Libro libro4 = new Libro("cronicasNarnia", 0);
        Libro libro5 = new Libro("alasNegras", 0);

        listaLibros[0] = libro1;
        listaLibros[1] = libro2;
        listaLibros[2] = libro3;
        listaLibros[3] = libro4;
        listaLibros[4] = libro5;
        System.out.println(listaLibros[0].getNombre());
        HttpSession sesion = request.getSession(true);
        sesion.setAttribute("arrayLibros", listaLibros);
        request.getRequestDispatcher(url).forward(request, response);
        System.out.println("SALGO DE GET CON EL ARRAY CARGADO " +listaLibros.length);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

package com.senac.madeinastec.servlets;

import com.senac.madeinastec.model.Produto;
import com.senac.madeinastec.service.ServicoCliente;
import com.senac.madeinastec.service.ServicoProduto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ConsultaProdutosVendaServlet", urlPatterns = {"/ConsultaProdutosVendaServlet"})
public class ConsultaProdutosVendaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sessao = request.getSession();
        ArrayList<Produto> Lista = new ArrayList();
        ServicoProduto sc = new ServicoProduto();
        String codigoempresa = (String) sessao.getAttribute("Empresa");

        try {
            Lista = (ArrayList<Produto>) sc.procurarProduto(codigoempresa, Integer.parseInt(codigoempresa));
        } catch (Exception e) {

        }

        sessao.setAttribute("ListaProduto", Lista);

        RequestDispatcher dispatcher
                = request.getRequestDispatcher("/venda.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Produto p = new Produto();

        ArrayList<Produto> Lista = new ArrayList();

        ServicoProduto sc = new ServicoProduto();

        HttpSession sessao = request.getSession();

        String produto = request.getParameter("nomeProd");
        String codigoempresa = (String) sessao.getAttribute("Empresa");

        try {

            Lista = (ArrayList<Produto>) sc.procurarProduto(produto, Integer.parseInt(codigoempresa));

        } catch (Exception e) {
            e.printStackTrace();
        }

        sessao.setAttribute("ListaProduto", Lista);
        response.sendRedirect(request.getContextPath() + "/venda.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

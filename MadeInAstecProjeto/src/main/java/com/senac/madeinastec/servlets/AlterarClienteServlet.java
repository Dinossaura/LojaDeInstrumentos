/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;


import com.senac.madeinastec.model.Cliente;
import com.senac.madeinastec.service.ServicoCliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author magno
 */
@WebServlet(name = "AlterarClienteServlet", urlPatterns = {"/alterarCliente"})
public class AlterarClienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          RequestDispatcher dispatcher
	    = request.getRequestDispatcher("/cadastroCliente.jsp");
    dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Instância Objeto Cliente
        Cliente cliente = new Cliente();
        
        //Instância serviço de servidor para efetuar consulta e ligação com ClienteDAO
        ServicoCliente sc = new ServicoCliente();
        
        //Criação se sessão para retorno em tela
        request.setCharacterEncoding("UTF-8");
        HttpSession sessao = request.getSession();
        sessao.removeAttribute("cpfexiste");    
        
        //Para verificação se é alteração
        String alteracao = "";
        try {
            alteracao = sessao.getAttribute("Altera").toString();
        } catch (Exception e) {
        }
        
        if ((alteracao == null)||(alteracao.length() == 0)){
              //Atribuição de valores digitados na tela de fornecedor e código da empresa
            String cpfCliente = request.getParameter("cpfcliente");
            String codigoempresa = (String) sessao.getAttribute("Empresa");
            
            
            try {
            cliente = sc.obterClientePorCpf(cpfCliente, Integer.parseInt(codigoempresa));
            } catch (Exception e) {
            }
        
            sessao.setAttribute("cli", cliente);
            sessao.setAttribute("Altera", "alteracao");
            response.sendRedirect(request.getContextPath() + "/cadastroCliente.jsp");
            
        }else{
            Cliente c = new Cliente();
            c = (Cliente) sessao.getAttribute("cli");
            request.setCharacterEncoding("UTF-8");
            String nome = request.getParameter("nome").toLowerCase();
            String sobrenome = request.getParameter("sobrenome");
            String sexo = request.getParameter("sexo");
            String dataNasc = request.getParameter("dataNasc");
            System.out.println(request.getParameter("dataNasc"));
            String rg = request.getParameter("rg");
            String tel1 = request.getParameter("tel1");
            String tel2 = request.getParameter("tel2");
            String email = request.getParameter("email");
            String numCasa = request.getParameter("numCasa");
            String complemento = request.getParameter("complemento");
            String end = request.getParameter("endereco");
            String cidade = request.getParameter("cidade");
            String cep = request.getParameter("cep");
            String estado = request.getParameter("estados");
            String empresa = request.getParameter("empresa");
            String cpf = c.getCpf();
            String codigoempresa = (String) sessao.getAttribute("Empresa");
        
            //Verifica campos obrigatórios
            if((nome.length() == 0)||(String.valueOf(codigoempresa).length() == 0)||(sobrenome.length() == 0)||
                    (sexo.length() == 0)||(rg.length() == 0)||(end.length() == 0)||(numCasa.length() == 0)||
                    (cep.length() == 0)||(cidade.length() == 0)||(estado.length()==0)){
                sessao.setAttribute("mensagemErroCampos", "Verifique campos obrigatórios!");
                RequestDispatcher dispatcher
                = request.getRequestDispatcher("/cadastroFornecedor.jsp");
                dispatcher.forward(request, response);
            }else{
                sessao.setAttribute("mensagemErroCampos", "");
                
                try {
                cliente.setNome(nome);
                cliente.setEmpresa(Integer.parseInt(codigoempresa));
                cliente.setSobrenome(sobrenome);
                cliente.setSexo(sexo);
                cliente.setIdade(dataNasc);
                cliente.setRg(rg);
                cliente.setTelefone(tel1);
                cliente.setTelefone2(tel2);
                cliente.setEmail(email);
                cliente.setNumero(numCasa);
                cliente.setComplemento(complemento);
                cliente.setEndereco(end);
                cliente.setCep(cep);
                cliente.setCidade(cidade);
                cliente.setEstado(estado);
                cliente.setCpf(cpf);
         
                sc.atualizarCliente(cliente);
                } catch (Exception e) {
                }
                response.sendRedirect(request.getContextPath() + "/consultarCliente.jsp");
                sessao.removeAttribute("Altera");
            }
            
        }
           
        
    }

}

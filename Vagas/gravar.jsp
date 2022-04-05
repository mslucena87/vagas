<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import = "classes.Banco" %>
<%@ page import = "classes.Vagas" %>

<%	
	try{
	String gravar= request.getParameter("descricao");
	if(gravar!=null || gravar.equals("")==false)
	{
		Vagas vg=new Vagas();
		vg.setDescricao(request.getParameter("descricao"));
		vg.setRequisitosObrigatorios(request.getParameter("requisitosObrigatorios"));
		vg.setRequisitosDesejaveis(request.getParameter("requisitosDesejaveis"));
		vg.setRemuneracao(request.getParameter("remuneracao"));
		vg.setBeneficios(request.getParameter("beneficios"));
		vg.setLocalDeTrabalho(request.getParameter("localDeTrabalho"));
		vg.setAberta(Integer.parseInt(request.getParameter("aberta")));
		
		Banco bd=new Banco();
		bd.inserir(vg);
		response.sendRedirect("./listar.jsp");
	}
	}catch(Exception ex){    }
	finally{ }
	

%>



<a href="./index.jsp">Home</a>
<a href="./gravar.jsp">Gravar</a>
<a href="./editar.jsp">Editar</a>
<a href="./excluir.jsp">Excluir</a>
<a href="./listar.jsp">Listar Todas</a>
<a href="./listar.jsp?lista=0">Listar Fechadas</a>
<a href="./listar.jsp?lista=1">Listar Abertas</a>

<form action="./gravar.jsp" method="post">
	ID:<input type="number" name="id" value="" disabled> <br>
	DESCRIÇÃO:<input type="text" name="descricao" required> <br>
	REQUISITOS OBRIGATÓRIOS:<input type="text" name="requisitosObrigatorios" required> <br>
	REQUISITOS DESEJÁVEIS:<input type="text" name="requisitosDesejaveis" required> <br>
	REMUNERAÇÃO:<input type="text" name="remuneracao" required> <br>
	BENEFÍCIOS:<input type="text" name="beneficios" required> <br>
	LOCAL DE TRABALHO:<input type="text" name="localDeTrabalho" required> <br>
	ABERTA:<input type="number" name="aberta" required> <br>
	
	<input type="submit" value="Enviar">


</form>

</body>
</html>
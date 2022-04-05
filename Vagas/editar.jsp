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

<a href="./index.jsp">Home</a>
<a href="./gravar.jsp">Gravar</a>
<a href="./editar.jsp">Editar</a>
<a href="./excluir.jsp">Excluir</a>
<a href="./listar.jsp">Listar Todas</a>
<a href="./listar.jsp?lista=0">Listar Fechadas</a>
<a href="./listar.jsp?lista=1">Listar Abertas</a>

<%
	Banco bd=new Banco();
	Vagas vg=null;
	int id=0;
	
	try{
	
		id = Integer.parseInt(request.getParameter("id"));	
		vg=bd.buscar(id);
		if(vg.getId()<0 || vg==null)
		{
			 response.sendRedirect("./listar.jsp");
		}
		
	
	}catch(Exception e){}
	
	
	try{
		String gravar=request.getParameter("descricao");	
		if(gravar!=null || gravar.equals("")==false)
		{
			vg=new Vagas();
			vg.setDescricao(request.getParameter("descricao"));
			vg.setRequisitosObrigatorios(request.getParameter("requisitosObrigatorios"));
			vg.setRequisitosDesejaveis(request.getParameter("requisitosDesejaveis"));
			vg.setRemuneracao(request.getParameter("remuneracao"));
			vg.setBeneficios(request.getParameter("beneficios"));
			vg.setLocalDeTrabalho(request.getParameter("localDeTrabalho"));
			vg.setAberta(Integer.parseInt(request.getParameter("aberta")));
			vg.setId(id);
			
			bd.editar(vg);
			response.sendRedirect("./listar.jsp");
		}
		}catch(Exception e){	out.println("Erro em Editar JSP");	}
		finally{ }
	
	
	%>


<h1>Editar</h1>
<form action="editar.jsp" method="post">
	ID:<input type="text" name="id" value="" disabled> <br>
	DESCRIÇÃO:<input type="text" name="descricao" id="descricao"> <br>
	REQUISITOS OBRIGATÓRIOS:<input type="text" name="requisitosObrigatorios" id="requisitosObrigatorios"> <br>
	REQUISITOS DESEJÁVEIS:<input type="text" name="requisitosDesejaveis" id="requisitosDesejaveis"> <br>
	REMUNERAÇÃO:<input type="text" name="remuneracao" id="remuneracao"> <br>
	BENEFÍCIOS:<input type="text" name="beneficios" id="beneficios"> <br>
	LOCAL DE TRABALHO:<input type="text" name="localDeTrabalho" id="localDeTrabalho"> <br>
	ABERTA:<input type="number" name="aberta" id="aberta"> <br>
	<input type="submit" value="Enviar">
</form>
<script>
	document.getElementByName("id")[0].value="<%=vg.getId()%>";
	document.getElementByName("descricao")[0].value="<%=vg.getDescricao()%>";
	document.getElementByName("requisitosObrigatorios")[0].value="<%=vg.getRequisitosObrigatorios()%>";
	document.getElementByName("requisitosDesejaveis")[0].value="<%=vg.getRequisitosDesejaveis()%>";
	document.getElementByName("remuneracao")[0].value="<%=vg.getRemuneracao()%>";
	document.getElementByName("beneficios")[0].value="<%=vg.getBeneficios()%>";
	document.getElementByName("localDeTrabalho")[0].value="<%=vg.getLocalDeTrabalho()%>";
	document.getElementByName("aberta")[0].value="<%=vg.getAberta()%>";
</script>
</body>
</html>
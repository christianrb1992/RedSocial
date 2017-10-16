package com.intravita.proyectointranet.persistencia;

import org.apache.commons.codec.digest.DigestUtils;
import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.BsonValue;

import com.intravita.proyectointranet.modelo.Administrador;
import com.intravita.proyectointranet.modelo.Usuario;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;

public class AdministradorDAOImpl {
	 public void insert (Administrador administrador) {
		  BsonDocument bso = new BsonDocument();
		  bso.append("nombre", new BsonString(administrador.getNombre()));
		  bso.append("pwd", new BsonString(DigestUtils.md5Hex(administrador.getClave())));
		  bso.append("email", new BsonString(administrador.getEmail()));
		  MongoBroker broker = MongoBroker.get();
		  MongoCollection<BsonDocument> administradores = broker.getCollection("Administradores");
		  FindIterable<BsonDocument> resultado=administradores.find(bso);
		  BsonDocument usuarioBso = resultado.first();
		  if (usuarioBso==null) {
		   administradores.insertOne(bso);
		  }
	 }
	
	 public void insertSinEncrypt (Administrador administrador) {
		  BsonDocument bso = new BsonDocument();
		  bso.append("nombre", new BsonString(administrador.getNombre()));
		  bso.append("pwd", new BsonString(administrador.getClave()));
		  bso.append("email", new BsonString(administrador.getEmail()));
		  MongoBroker broker = MongoBroker.get();
		  MongoCollection<BsonDocument> administradores = broker.getCollection("Administradores");
		  FindIterable<BsonDocument> resultado=administradores.find(bso);
		  BsonDocument usuarioBso = resultado.first();
		  if (usuarioBso==null) {
		   administradores.insertOne(bso);
		  }
	 }
	 
	 public Administrador select(Administrador generico) {
		  MongoBroker broker = MongoBroker.get();
		  MongoCollection<BsonDocument> administradores = broker.getCollection("Administradores");
		  BsonDocument criterio = new BsonDocument();
		  criterio.append("nombre", new BsonString(generico.getNombre()));
		  criterio.append("pwd", new BsonString(DigestUtils.md5Hex(generico.getClave())));
		  FindIterable<BsonDocument> resultado=administradores.find(criterio);
		  BsonDocument usuario = resultado.first();
		  Administrador result;
		  if (usuario==null) {
			  result=new Administrador("-","-");
		  }
		  else {
			  result = new Administrador(generico.getNombre(),generico.getClave());
		  }
		  return result;
	 }
	 public void delete (Administrador administrador) {
		  BsonDocument bso = new BsonDocument();
		  bso.append("nombre", new BsonString(administrador.getNombre()));
		
		  MongoBroker broker = MongoBroker.get();
		  MongoCollection<BsonDocument> administradores = broker.getCollection("Administradores");
		  administradores.deleteOne(bso);
	 }
	 public void update(String nombre, String pwdAntigua, String pwdNueva) {
		  MongoBroker broker = MongoBroker.get();
		  MongoCollection<BsonDocument> administradores = broker.getCollection("Administradores");
		  BsonDocument criterio = new BsonDocument();
		  criterio.append("nombre", new BsonString(nombre));
		  criterio.append("pwd", new BsonString(pwdAntigua));
		  FindIterable<BsonDocument> resultado=administradores.find(criterio);
		  BsonDocument administrador = resultado.first();
		  BsonDocument actualizacion= new BsonDocument("$set", new BsonDocument("pwd", new BsonString(pwdNueva)));
		  administradores.findOneAndUpdate(administrador, actualizacion);
	 }
	 
		public Administrador selectNombre(Administrador generico) {
			MongoBroker broker = MongoBroker.get();
			MongoCollection<BsonDocument> administradores = broker.getCollection("Administradores");
			BsonDocument criterio = new BsonDocument();
			criterio.append("nombre", new BsonString(generico.getNombre()));
			FindIterable<BsonDocument> resultado=administradores.find(criterio);
			BsonDocument administrador = resultado.first();
			Administrador result;
			if (administrador==null) {
				result=new Administrador("-","-", "-");
			}
			else {
				BsonValue nombre=administrador.get("nombre");
				BsonString name=nombre.asString();
				String nombreFinal=name.getValue();
				
				BsonValue pwd=administrador.get("pwd");
				BsonString password=pwd.asString();
				String pwdFinal=password.getValue();
				
				BsonValue email=administrador.get("email");
				BsonString correo=email.asString();
				String emailFinal=correo.getValue();
				result = new Administrador(nombreFinal, pwdFinal, emailFinal);
			}
			return result;
		}
}
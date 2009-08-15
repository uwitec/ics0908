package com.mydomain.data;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.dbserver.DBServer;

/**
 * This is not a best practices class. It's just an example to give you an idea
 * of how iBATIS works. For a more complete example, see JPetStore 5.0 at
 * http://www.ibatis.com.
 */
public class SimpleExample {

	// public static Account selectAccountById (int id) throws SQLException {
	// return (Account) sqlMapper.queryForObject("selectAccountById", id);
	// }
	//
	// public static void insertAccount (Account account) throws SQLException {
	// sqlMapper.insert("insertAccount", account);
	// }
	//
	// public static void updateAccount (Account account) throws SQLException {
	// sqlMapper.update("updateAccount", account);
	// }
	//
	// public static void deleteAccount (int id) throws SQLException {
	// sqlMapper.delete("deleteAccount", id);
	// }

	public static void main(String[] args) throws Exception {
		try {
			Person p = new Person();
			p.setFirstName("Zho");
			p.setLastName("Lizhi");
			p.setHeightInMeters(1.8d);
			p.setId(3);
			p.setWeightInKilograms(90d);

			DBServer.quider.insertObject(p);
			System.out.println("插入新对象：" + p);

			Object obj = DBServer.quider.queryForObjectById(3, Person.class);
			if (obj instanceof Person) {
				Person person = (Person) obj;
				System.out.println("查找的对象：" + person);
			}
			System.out.println(DBServer.quider.queryForList("selectAllPerson", p, 0, 11));

			p.setBirthDate(new Date());
			DBServer.quider.updateObject(p);
			obj = DBServer.quider.queryForObjectById(3, Person.class);
			if (obj instanceof Person) {
				Person person = (Person) obj;
				System.out.println("查找更新后对象：" + person);
			}

			List<?> list = DBServer.quider.queryForList(Person.class);

			
			System.out.println("查找所有对象：");
			for (Object o : list) {
				if (o instanceof Person) {
					Person pp = (Person) o;
					System.out.println("  对象：" + pp);
				}
			}

			DBServer.quider.deleteObject(p);
			list = DBServer.quider.queryForList(Person.class);
			System.out.println("查找所有对象：");
			for (Object o : list) {
				if (o instanceof Person) {
					Person pp = (Person) o;
					System.out.println("  对象：" + pp);
				}
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}

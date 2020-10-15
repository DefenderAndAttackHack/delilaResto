// Router
const router = require("express").Router();
// Sequelize
const sequelize = require("../../database/database")
// Services & Utils
const { get_by_param } = require("../services/index");

router.post("/v1/admin", async (req, res, next) => {
	const username = username.req.body;
	 const password = password.req.body;
	  const email = email.req.body;
	  const delivery_address = delivery_address.req.body;
	  const full_name = full_name.req.body;
	   const phone = phone.req.body;
	try {
		const existing_username = await get_by_param("users", "username", username);
		const existing_email = await get_by_param("users", "email", email);
		if (existing_username) {
			res.status(409).json("Username already exists, please pick another");
			return;
		}
		if (existing_email) {
			res.status(409).json("Email already exists, please pick another");
			return;
		}
		if (username && password && email && delivery_address && full_name && phone) {
			const insert = await sequelize.query(
				"INSERT INTO users (username, password, full_name, email, phone, delivery_address, is_admin) VALUES (:username, :password, :full_name, :email, :phone, :delivery_address, TRUE)",
				{ replacements: { username, password, full_name, email, phone, delivery_address } }
			);
			res.status(200).json("Admin User correctly added to database");
		} else {
			res.status(400).json("Error validating input data");
		}
	} catch (error) {
		next(new Error(error));
	}
});

module.exports = router;

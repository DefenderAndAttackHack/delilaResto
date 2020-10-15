// Sequelize
const { QueryTypes } = require("sequelize");
const sequelize = require("../../database/database")
// JWT
const jwt = require("jsonwebtoken");
// env
if (process.env.NODE_ENV !== "production") {
	require("dotenv").config();
}
require("dotenv").config();
 const JWT_SECRET = "secret";
// Functions & Middlewares
function generate_token(info) {
	return jwt.sign(info, JWT_SECRET, { expiresIn: "1h" });
}
function filter_empty_props(inputObject) {
	Object.keys(inputObject).forEach((key) => !inputObject[key] && delete inputObject[key]);
	return inputObject;
}
async function get_by_param(table, tableParam, inputParam = "TRUE", all = false) {
	const searchResults = await sequelize.query(`SELECT * FROM ${table} WHERE ${tableParam} = :replacementParam`, {
		replacements: { replacementParam: inputParam },
		type: QueryTypes.SELECT,
	});
	console.log(searchResults);
	return !!searchResults.length ? (all ? searchResults : searchResults[0]) : false;
}
function compare_same_user_id(baseUserId, found_userId) {
	if (found_userId && baseUserId !== found_userId) {
		console.log("Base User ID:", baseUserId, "Found User ID:", found_userId);
		console.log("Different username, same data");
		return true;
	} else {
		return false;
	}
}
function filter_sensitive_data(userArray, filters) {
	return userArray.map((user) => {
		filters.forEach((filter) => delete user[filter]);
		return user;
	});
}

module.exports = {
	generate_token,
	filter_empty_props,
	get_by_param,
	compare_same_user_id,
	filter_sensitive_data,
};

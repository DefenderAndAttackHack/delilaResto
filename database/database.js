const Sequelize = require("sequelize");
const sequelize = new Sequelize("delilahResto", "root", "2580", {
    host: "localhost",
    dialect: "mysql",
    operatorsAliases: false
}); 


module.exports = sequelize;

global.sequelize = sequelize;



module.exports = (sequelize, Sequelize) => {
  const client = sequelize.define("client", {
    family: {
      type: Sequelize.STRING
    },
    name: {
      type: Sequelize.STRING
    },
    mobile: {
      type: Sequelize.STRING
    },
    email: {
      type: Sequelize.STRING
    },
    id_us: {
      type: Sequelize.INTEGER
    }
  });

  return client;
};

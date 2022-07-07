let createError = require('http-errors');
let express = require('express');
let path = require('path');
let cookieParser = require('cookie-parser');
let bodyParser = require('body-parser');
let logger = require('morgan');


//rutas
let indexRouter = require('./routes/index');
let usersRouter = require('./routes/users');
let historialClinicoRouter = require('./routes/historialClinico');
let medicosRouter = require('./routes/medicos');






let app = express();

// configurar vistas ejs desde la carpeta views
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

//se utiliza para ver trafico de red en la consola
app.use(logger('dev'));
app.use(express.json());
//se usa para ver los datos enviados desde un formulario
app.use(express.urlencoded({ extended: false }));

app.use(cookieParser());
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

app.use(express.static(path.join(__dirname, 'public')));

//rutas que se van a dirigir segun lo solicitado por el cliente
app.use('/', indexRouter);
app.use('/Historial_Clinico/', historialClinicoRouter );
app.use('/users', usersRouter);
app.use('/medicos', medicosRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
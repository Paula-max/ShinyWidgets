library(shiny)

ui<- fluidPage(
  
  titlePanel("Widgets básicos"),
  
  fluidRow(
    #el ancho de 3 nos permite tener 4 columnas ya que el ancho total es de 12
    column(3, 
           h4("Botones"),
           #el texto de label aparecerá dentro del botón
           actionButton(inputId = 'accion', 
                        label = "Acción"),
           br(),
           br(),
           #no necesita inputId
           #su segundo parámetro es icon, shiny tiene iconos predefinidos
           #para ver los iconos disponibles https://fontawesome.com/icons?from=io
           submitButton(text = "Apply Changes", 
                        icon = icon("bullseye")) 
           ), 
    column(3, 
           h4("Checkbox"),
           #si value está a true el checkbox estará marcado por defecto
           checkboxInput(inputId = "Checkbox", 
                         label = "Mostrar", value = T)),
    column(3, 
           h4("Checkgroup"),
           #se pueden selecionar más de un checkbox (no excluyentes)
           #el parámetro selected para decidir si un checkbox aparece marcado por defecto
           #el parametro inline permite seleccionar si las checkbox se colocan en linea
           checkboxGroupInput(inputId = "checkgroup", 
                              label = h5("Seleciciona una o varias opciones"), 
                              choices = list("Opción 1" = 1,
                                             "Opción 2" = 2,
                                             "Opción 3" = 3),
                              selected = NULL,
                              inline = F)
           ),
    column(3, 
           h4("Fecha"),
           dateInput(inputId = "fecha",
                     label = h5("Selecciona una fecha"),
                     value = "2020-02-01"))
  ),
  
  fluidRow(
    column(3, 
           h4("Rango de fechas"),
           #start y end están a NULL por defecto y se muestra la fecha actual
           #el atributo separator nos permite cambiar la palabra que está en medio de ambas fechas 
           #el parámetro language te permite poner el calendario en español "es"
           dateRangeInput(inputId = "RangoFechas",
                          label = h5("Elige una fecha de inicio y otra de fin"), 
                          start= NULL, end = NULL,
                          separator = "hasta",
                          language = "es",
                          format = "dd-mm-yyyy")),
    column(3,
           h4("Ficheros"),
           #el parámetro buttonlabel te permite cambiar el nombre del botón o poner un icono
           #multiple te permite subir varios ficheros
           fileInput(inputId = "fichero",
                     label = h5("Selecciona un fichero o ficheros para subir"),
                     buttonLabel = icon("folder-open"),
                     multiple = T)),
    column(3,
           h4("Texto de ayuda"),
           #da igual por donde cortes el texto, los cortes se hará según el espacio dado
           helpText("Nota: El texto de ayuda no es un widget realmente",
                    "pero permite agregar texto de manera sencilla para",
                    "acompañar a otros widgets.")),
    column(3,
           h4("Entrada numérica"),
           numericInput(inputId = "numerico", 
                        label = h5("Introduce un valor numérico"),
                        value = 18,
                        min = 0,
                        max = 20,
                        step = 2))
  ),

  fluidRow(
    column(3,
           h4("RadioButton"),
           #similar al checkbox pero con selección excluyente
           radioButtons(inputId = "radio",
                        label = h5("Selecciona una opción"),
                        choices = list("Opción 1" = 1,
                                       "Opción 2" = 2,
                                       "Opción 3" = 3))
           ),
    column(3,
           h4("Selección desplegable"),
           #similar al RadioButton pero con un desplegable
           selectInput(inputId = "seleccion",
                       label = h5("Selecciona una opción"),
                       choices = list("Opción A" = 1,
                                      "Opción B" = 2,
                                      "Opción C" = 3))
           ),
    column(3,
           h4("Slider"),
           sliderInput(inputId = "slider", 
                       label = h5("Slider de un valor"),
                       min = 0,
                       max = 100,
                       value = 50,
                       step = 10),
           br(),
           sliderInput(inputId = "slider2",
                       label = h5("Slider de 2 valores"),
                       min = 0,
                       max = 100,
                       value = c(30,70))
           ),
    column(3,
           h4("InputTexto"),
           textInput(inputId = "inputTexto",
                     #placeholder permite poner un texto que al pinchar desaparece
                     label = h5("Introduce un texto"),
                     placeholder = "Escribe aquí tu nombre"))
  )
)


server <- function(input, output){}
shinyApp(ui = ui, server = server)
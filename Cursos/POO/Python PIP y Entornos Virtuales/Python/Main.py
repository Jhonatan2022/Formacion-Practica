import Utils
import Read_Csv
import Charts

def run():
    data = Read_Csv.read_csv('data.csv')
    data = list(filter(lambda item: item['Continent'] == 'South America', data))


    countries = list(map(lambda x: x['Country'], data))
    percentages = list(map(lambda x: x['World Population Percentage'], data))
    Charts.generate_pie_chart(countries, percentages)

    country = input('Type Country: ')

    result = Utils.population_by_country(data, country)

    if len(result) > 0:
        country = result[0]
        labels, values = Utils.get_population(country)
        Charts.generate_bar_chart(country['Country'], labels, values)

if __name__ == '__main__':
    run()
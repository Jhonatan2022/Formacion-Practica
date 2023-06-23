import Utils
import Read_Csv
import Charts
import pandas as pd

def run():
    
    df = pd.read_csv('data.csv')
    df = df[df['Continent'] == 'Africa']

    countries = df['Country'].values
    percentages = df['World Population Percentage'].values
    Charts.generate_pie_chart(countries, percentages)


    data = Read_Csv.read_csv('data.csv')
    country = input('Type Country: ')

    result = Utils.search_country(data, country)

    if len(result) > 0:
        country = result[0]
        labels, values = Utils.get_population(country)
        Charts.generate_bar_chart(country['Country'], labels, values)

if __name__ == '__main__':
    run()
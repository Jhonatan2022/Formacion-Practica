import matplotlib.pyplot as plt


# def generate_pie_chart():
#     labels = ['Python', 'C++', 'Ruby', 'Java', 'PHP', 'Perl']
#     sizes = [33, 52, 12, 17, 62, 48]

#     fig1, ax1 = plt.subplots()
#     ax1.pie(sizes, labels=labels)
#     plt.savefig('Pie.png')
#     plt.close()

def generate_bar_chart(name, labels, values):
    fig1, ax1 = plt.subplots()
    ax1.bar(labels, values)
    plt.savefig(f'../img/{name}.png')
    plt.close()


def generate_pie_chart(labels, values):
    fig1, ax1 = plt.subplots()
    ax1.pie(values, labels=labels)
    ax1.axis('equal')
    plt.savefig('../img/Pie2.png')
    plt.close()


if __name__ == '__main__':
    labels = ['Python', 'C++', 'Ruby', 'Java', 'PHP', 'Perl']
    values = [33, 52, 12, 17, 62, 48]
    generate_pie_chart(labels, values) 
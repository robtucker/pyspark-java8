import pytest

from pyspark.sql import DataFrame


def to_array(df: DataFrame):
    '''Convert a dataframe to an array of arrays'''
    return [list(row) for row in df.collect()]


@pytest.mark.usefixtures('spark')
def test_pyspark(spark):
    '''Test that its possible to successfully create a pyspark dataframe'''

    data = [
        ('a', 1),
        ('b', 2),
        ('c', 3),
    ]

    df = spark.createDataFrame(data, ['col_a', 'col_b'])
    df.show()
    assert to_array(df) == [list(row) for row in data]


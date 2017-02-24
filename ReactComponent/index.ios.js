/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React from 'react';
import {
  AppRegistry,
  View,
  Text,
} from 'react-native';


export default function ipadTest() {
  console.log('this.props == ',this.props);
  return (
    <View style={{ alignself:'center',justifyContent:'center' }}>
      <Text>{'sadasd'}</Text>
    </View>
  );
}

AppRegistry.registerComponent('ipadTest', () => ipadTest);

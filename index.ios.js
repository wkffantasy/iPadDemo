/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React from 'react';
import {
  AppRegistry
} from 'react-native';

import RootView from './RootView';

export default function learningRNDemo() {
  return (
    <RootView />
  );
}

AppRegistry.registerComponent('learningRNDemo', () => learningRNDemo);
